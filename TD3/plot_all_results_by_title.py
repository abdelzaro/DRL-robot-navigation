import os
import numpy as np
import matplotlib.pyplot as plt

# === CONFIGURATION ===
results_dir = '/home/power20/DRL-robot-navigation/TD3/results'  # or full path
file_prefix = 'TD3_velodyne_5gaps_added'  # what to match before the timestamp

# === LOAD & FILTER FILES ===
all_files = [f for f in os.listdir(results_dir)
             if f.endswith('.npy') and f.startswith(file_prefix)]

# max_files = 3  # only show the last 10 logs
# all_files = sorted(all_files)[-max_files:]

if not all_files:
    print(f"No files found starting with '{file_prefix}'")
    exit()

print(f"Found {len(all_files)} files matching prefix '{file_prefix}'.")

# === LOAD & PLOT ===
plt.figure(figsize=(12, 6))

for filename in sorted(all_files):
    path = os.path.join(results_dir, filename)
    try:
        data = np.load(path, allow_pickle=True)
        if isinstance(data[0], dict) and 'reward' in data[0]:
            rewards = [d['reward'] for d in data]
        else:
            rewards = data  # assume it's a simple array of rewards

        label = filename.split('_')[-1].split('.')[0]  # short suffix (timestamp)
        plt.plot(rewards, label=label)

    except Exception as e:
        print(f"Skipping {filename}: {e}")

plt.title(f"Evaluation Rewards: {file_prefix}")
plt.xlabel("Episode")
plt.ylabel("Reward")
plt.grid(True)
plt.legend(loc='best', fontsize='small')
plt.tight_layout()
plt.show()
