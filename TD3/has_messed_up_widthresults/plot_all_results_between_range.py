import os
import numpy as np
import matplotlib.pyplot as plt

# === CONFIGURATION ===
results_dir = '/home/power20/DRL-robot-navigation/TD3/results'

# === START/END FILES ===
start_file = 'TD3_velodyne_20250710-221019.npy'
end_file   = 'TD3_velodyne_20250711-060211.npy'

# === LOAD & SORT ALL .npy FILES ===
all_files = sorted(f for f in os.listdir(results_dir) if f.endswith('.npy'))

# === VALIDATE START/END ===
if start_file not in all_files or end_file not in all_files:
    print(f"[ERROR] Start or end file not found in: {results_dir}")
    print(f"Available files:\n{all_files}")
    exit()

start_idx = all_files.index(start_file)
end_idx = all_files.index(end_file) + 1  # +1 to include end_file

selected_files = all_files[start_idx:end_idx]
print(f"Plotting {len(selected_files)} files from:\n{start_file} to {end_file}")

# === LOAD & PLOT ===
plt.figure(figsize=(12, 6))

for filename in selected_files:
    path = os.path.join(results_dir, filename)
    try:
        data = np.load(path, allow_pickle=True)
        if isinstance(data[0], dict) and 'reward' in data[0]:
            rewards = [d['reward'] for d in data]
        else:
            rewards = data.tolist()

        label = filename.replace('.npy', '').split('_')[-1]  # timestamp
        plt.plot(rewards, label=label)

    except Exception as e:
        print(f"Skipping {filename}: {e}")

plt.title(f"Evaluation Rewards\n{start_file} to {end_file}")
plt.xlabel("Episode")
plt.ylabel("Reward")
plt.grid(True)
plt.legend(loc='best', fontsize='small')
plt.tight_layout()
plt.show()
