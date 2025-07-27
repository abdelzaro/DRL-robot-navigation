import os
import numpy as np
import sys

# === PARSE ARGUMENTS ===
if len(sys.argv) != 2:
    print("Usage: python3 high_reward.py <file_prefix>")
    sys.exit(1)

file_prefix = sys.argv[1]
results_dir = '/home/p14/DRL-robot-navigation/TD3/results/'
episode_limit = 115  # Only consider rewards from episodes ≤ 40

# === LOAD & FILTER FILES ===
all_files = [f for f in os.listdir(results_dir)
             if f.endswith('.npy') and f.startswith(file_prefix)]

if not all_files:
    print(f"No .npy files found for prefix '{file_prefix}'")
    sys.exit(1)

# === FIND FILE WITH BEST EARLY EPISODE REWARD ===
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

        for i, r in enumerate(rewards):
            if i <= episode_limit and r > max_reward:
                max_reward = r
                best_file = filename
                best_episode = i

    except Exception as e:
        print(f"Skipping {filename}: {e}", file=sys.stderr)

# === OUTPUT FOR SHELL ===
if best_file:
    model_name = best_file.replace(".npy", "") + "_actor" 
    print(model_name)
else:
    print(f"No valid reward data found for prefix '{file_prefix}'", file=sys.stderr)
    sys.exit(1)
