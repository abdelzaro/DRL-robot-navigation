import os
import numpy as np

# === CONFIGURATION ===
results_dir = '/home/asus/DRL-robot-navigation/TD3/results/'  # Adjust path if needed
file_prefix = 'TD3_velodyne_run5_5gap_width_normalized_x5speed'  # Prefix of result files

# === LOAD & FILTER FILES ===
all_files = [f for f in os.listdir(results_dir)
             if f.endswith('.npy') and f.startswith(file_prefix)]

if not all_files:
    print(f"No files found starting with '{file_prefix}'")
    exit()

# === FIND FILE WITH HIGHEST REWARD ===
max_reward = -np.inf
best_file = None
best_episode = -1

for filename in sorted(all_files):
    path = os.path.join(results_dir, filename)
    try:
        data = np.load(path, allow_pickle=True)
        if isinstance(data[0], dict) and 'reward' in data[0]:
            rewards = [d['reward'] for d in data]
        else:
            rewards = data

        file_max = max(rewards)
        if file_max > max_reward:
            max_reward = file_max
            best_file = filename
            best_episode = np.argmax(rewards)

    except Exception as e:
        print(f"Skipping {filename}: {e}")

# === OUTPUT ===
if best_file:
    print(f"Highest reward is {max_reward:.2f} in file:\n{best_file}")
    print(f"(Occurred at episode {best_episode})")
else:
    print("No valid reward data found.")
