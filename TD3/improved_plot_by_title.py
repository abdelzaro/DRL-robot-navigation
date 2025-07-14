import os
import re
import numpy as np
import matplotlib.pyplot as plt

# === CONFIGURATION ===
results_dir = '/home/az/DRL-robot-navigation/TD3/results/1gap_run2'  # full path
file_prefix = 'TD3_velodyne_1gap'  # exact match prefix

# === LOAD & FILTER FILES ===
pattern = re.compile(rf"^{file_prefix}(_\d+)?\.npy$")  # e.g., TD3_velodyne_1gap_12345.npy or TD3_velodyne_1gap.npy

all_files = [
    f for f in os.listdir(results_dir)
    if f.endswith('.npy') and pattern.match(f)
]

if not all_files:
    print(f"No files found matching pattern '{file_prefix}(_<digits>).npy'")
    exit()

print(f"Found {len(all_files)} files matching '{file_prefix}' (excluding *_run1 etc).")

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

        label = filename.split('_')[-1].split('.')[0]  # short suffix (e.g., timestamp or number)
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
