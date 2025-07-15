import os
import numpy as np
import matplotlib.pyplot as plt

# === CONFIGURATION ===
results_dir = '/home/power20/DRL-robot-navigation/TD3/results'
file_prefix = 'TD3_velodyne_5gaps_added'

# === LOAD & FILTER FILES ===
all_files = [f for f in os.listdir(results_dir)
             if f.endswith('.npy') and f.startswith(file_prefix)]

# max_files = 100  # number of subplots (one per file)
# all_files = sorted(all_files)[-max_files:]
max_files = len(all_files)

if not all_files:
    print(f"No files found starting with '{file_prefix}'")
    exit()

print(f"Found {len(all_files)} files matching prefix '{file_prefix}'.")

# === CREATE SUBPLOTS ===
fig, axes = plt.subplots(nrows=max_files, ncols=1, figsize=(10, 4 * max_files), sharex=True)

# If only one subplot, wrap it in a list for uniform indexing
if max_files == 1:
    axes = [axes]

for ax, filename in zip(axes, all_files):
    path = os.path.join(results_dir, filename)
    try:
        data = np.load(path, allow_pickle=True)
        if isinstance(data[0], dict) and 'reward' in data[0]:
            rewards = [d['reward'] for d in data]
        else:
            rewards = data

        label = filename.split('_')[-1].split('.')[0]
        ax.plot(rewards)
        ax.set_title(f"Rewards for {label}")
        ax.set_ylabel("Reward")
        ax.grid(True)

    except Exception as e:
        print(f"Skipping {filename}: {e}")
        ax.set_visible(False)

axes[-1].set_xlabel("Episode")
fig.suptitle(f"Evaluation Rewards for: {file_prefix}", fontsize=14)
plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.show()
