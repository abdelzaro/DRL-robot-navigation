import os
import numpy as np
import matplotlib.pyplot as plt

# === CONFIGURATION ===
results_dir = '/home/power20/DRL-robot-navigation/TD3/results'
file_prefix = 'TD3_velodyne_5gaps_added'

# === LOAD & FILTER FILES ===
all_files = [f for f in os.listdir(results_dir)
             if f.endswith('.npy') and f.startswith(file_prefix)]

max_files = 3  # only show the last N logs
all_files = sorted(all_files)[-max_files:]

if not all_files:
    print(f"No files found starting with '{file_prefix}'")
    exit()

print(f"Found {len(all_files)} files matching prefix '{file_prefix}'.")

# === LOAD ALL REWARD ARRAYS ===
reward_runs = []

for filename in all_files:
    path = os.path.join(results_dir, filename)
    try:
        data = np.load(path, allow_pickle=True)
        if isinstance(data[0], dict) and 'reward' in data[0]:
            rewards = [d['reward'] for d in data]
        else:
            rewards = data.tolist()
        reward_runs.append(rewards)
    except Exception as e:
        print(f"Skipping {filename}: {e}")

if not reward_runs:
    print("No valid reward data found.")
    exit()

# === PAD RUNS TO SAME LENGTH ===
max_len = max(len(r) for r in reward_runs)
padded_rewards = np.array([
    np.pad(r, (0, max_len - len(r)), constant_values=np.nan)
    for r in reward_runs
])

# === CALCULATE MEAN ± STD ===
mean_rewards = np.nanmean(padded_rewards, axis=0)
std_rewards = np.nanstd(padded_rewards, axis=0)

# === PLOT MEAN ± STD ===
plt.figure(figsize=(10, 6))
plt.plot(mean_rewards, label='Mean Reward')
plt.fill_between(range(len(mean_rewards)),
                 mean_rewards - std_rewards,
                 mean_rewards + std_rewards,
                 alpha=0.3, label='±1 Std Dev')

plt.title(f"Evaluation Rewards (Mean ± Std): {file_prefix}")
plt.xlabel("Episode")
plt.ylabel("Reward")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()
