import time

import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
import argparse

from velodyne_env import GazeboEnv
import csv 
import os

# Define paths
base_dir = "/home/az/DRL-robot-navigation/TD3"
nav_data_dir = os.path.join(base_dir, "nav_data")
plot_dir = os.path.join(nav_data_dir, "plots")

# Create directories if they don't exist
os.makedirs(nav_data_dir, exist_ok=True)
os.makedirs(plot_dir, exist_ok=True)

parser = argparse.ArgumentParser()
parser.add_argument(
    "model",
    type=str,
    help="Model filename without .pth (e.g., TD3_velodyne_20250710-200821_actor)"
)
args = parser.parse_args()

file_name = args.model

csv_filename = f"run_stats_{file_name}.csv"

csv_filename = os.path.join(nav_data_dir, f"run_stats_{file_name}.csv")
csv_file = open(csv_filename, mode="w", newline='')
csv_writer = csv.writer(csv_file)
csv_writer.writerow(["episode", "steps", "collisions", "timeout", "runtime_s", "success"])


import subprocess



class Actor(nn.Module):
    def __init__(self, state_dim, action_dim):
        super(Actor, self).__init__()

        self.layer_1 = nn.Linear(state_dim, 800)
        self.layer_2 = nn.Linear(800, 600)
        self.layer_3 = nn.Linear(600, action_dim)
        self.tanh = nn.Tanh()

    def forward(self, s):
        s = F.relu(self.layer_1(s))
        s = F.relu(self.layer_2(s))
        a = self.tanh(self.layer_3(s))
        return a


# TD3 network
class TD3(object):
    def __init__(self, state_dim, action_dim):
        # Initialize the Actor network
        self.actor = Actor(state_dim, action_dim).to(device)

    def get_action(self, state):
        # Function to get the action from the actor
        state = torch.Tensor(state.reshape(1, -1)).to(device)
        return self.actor(state).cpu().data.numpy().flatten()

    # def load(self, filename, directory):
    #     # Function to load network parameters
    #     self.actor.load_state_dict(
    #         torch.load("%s/%s_actor.pth" % (directory, filename))
    #     )

    def load(self, filename, directory):
        self.actor.load_state_dict(
            torch.load("%s/%s.pth" % (directory, filename))
        )

# Set the parameters for the implementation
# device = torch.device("cuda" if torch.cuda.is_available() else "cpu")  # cuda or cpudevice = torch.device("cpu")
device = torch.device("cpu")

seed = 0  # Random seed number
max_ep = 500  # maximum number of steps per episode
# file_name = "TD3_velodyne"  # name of the file to load the policy from


# Create the testing environment
measure_collisions = True #collects data on number of collisions
num_collisions = 0
num_successes = 0
num_timeouts = 0
total_time = 0.0
episode_num = 0

environment_dim = 20
robot_dim = 4
dgap_number_gaps_dim = 0 * 5 # 5 gaps * 4 floats in the dgap_flat_list
env = GazeboEnv("multi_robot_scenario.launch", environment_dim)
time.sleep(5)
torch.manual_seed(seed)
np.random.seed(seed)
state_dim = environment_dim + robot_dim + dgap_number_gaps_dim
# state_dim = environment_dim + robot_dim
action_dim = 2
total_runs = 1000
# Create the network
network = TD3(state_dim, action_dim)
try:
    network.load(file_name, "./pytorch_models")
except:
    raise ValueError("Could not load the stored model parameters")

done = False
episode_timesteps = 0
state = env.reset()
episode_start_time = time.time()

i = 1
# Begin the testing loop
while i <= (total_runs):
    print(i)
    while not done and episode_timesteps < max_ep:
        
        action = network.get_action(np.array(state))

        # Update action to fall in range [0,1] for linear velocity and [-1,1] for angular velocity
        a_in = [(action[0] + 1) / 2, action[1]]

        if not measure_collisions: 
            next_state, reward, done, target = env.step(a_in)
        else: 
            next_state, reward, done, target, collision= env.step(a_in)
            if collision: 
                num_collisions += 1
                print(f"(Collision Count:{num_collisions}, Step {episode_timesteps}, Reward: {reward:.2f}")

        if done and target:
            num_successes += 1

        # done = 1 if episode_timesteps + 1 == max_ep else int(done) #loop handles this

        # On termination of episode   
        state = next_state
        episode_timesteps += 1
    
    run_time = time.time() - episode_start_time
    total_time += run_time

    if episode_timesteps >= max_ep:
        num_timeouts += 1

    print(f"[DONE] Episode {episode_num} finished in {episode_timesteps} steps, {run_time:.2f}s")
   
    state = env.reset()
    done = False
    episode_timesteps = 0
    timeout_flag = int(episode_timesteps >= max_ep)
    success_flag = int(target)  # assuming `target=True` if goal reached
    csv_writer.writerow([episode_num, episode_timesteps, num_collisions, timeout_flag, f"{run_time:.3f}", success_flag])


    episode_start_time = time.time()
    episode_num += 1
    i += 1


#outside the loop
# print("total collisions over all the runs: " + str(num_collisions))

avg_time = total_time / total_runs

csv_file.close()
print("\n=== RUN SUMMARY ===")
print(f"Total Episodes       : {total_runs}")
print(f"Total Collisions     : {num_collisions}")
print(f"Timeouts (max steps) : {num_timeouts}")
print(f"Total Runtime        : {total_time:.2f} seconds")
print(f"Average per Episode  : {avg_time:.2f} seconds")

print("\nGenerating plots...")
subprocess.run(["python3", "nav_plot.py", file_name, plot_dir])
