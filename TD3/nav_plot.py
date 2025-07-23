import sys
import os
import csv
import matplotlib.pyplot as plt
import numpy as np

if len(sys.argv) != 3:
    print("Usage: python nav_plot.py <model_name> <plot_dir>")
    sys.exit(1)

model_name = sys.argv[1]
plot_dir = sys.argv[2]

# Construct path to CSV file
csv_path = os.path.join("/home/az/DRL-robot-navigation/TD3/nav_data", f"run_stats_{model_name}.csv")

# Create plot_dir if needed
os.makedirs(plot_dir, exist_ok=True)

# Load data
episodes = []
collisions = []
timeouts = []
runtimes = []
successes = []

with open(csv_path, 'r') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        episodes.append(int(row["episode"]))
        collisions.append(int(row["collisions"]))
        timeouts.append(int(row["timeout"]))
        runtimes.append(float(row["runtime_s"]))
        successes.append(int(row["success"]))

# Compute totals for the stacked outcome bar
total_collisions = sum(collisions)
total_timeouts = sum(timeouts)
total_successes = sum(successes)

# --- Compute stats for mean runtime ---
mean_runtime = np.mean(runtimes)
std_runtime = np.std(runtimes)

# Create subplots
fig, axs = plt.subplots(3, 1, figsize=(10, 14))
fig.suptitle("Episode Performance Metrics", fontsize=16)

# --- Subplot 1: Single Stacked Outcome Bar ---


# Convert cumulative collisions to per-episode binary
per_episode_collisions = [int(i > 0) for i in np.diff([0] + collisions)]

# Count each outcome type
total_successes = sum(successes)
total_timeouts = sum(timeouts)
total_collisions = sum(per_episode_collisions)

# Total outcomes
labels = ["Collision", "Timeout", "Success"]
values = [total_collisions, total_timeouts, total_successes]
colors = ['red', 'gray', 'green']

# Single stacked bar
axs[0].bar(["Episodes"], values[0], label=labels[0], color=colors[0])
axs[0].bar(["Episodes"], values[1], bottom=values[0], label=labels[1], color=colors[1])
axs[0].bar(["Episodes"], values[2], bottom=np.add(values[0], values[1]), label=labels[2], color=colors[2])
axs[0].set_ylabel("Count")
axs[0].set_title("Total Episode Outcomes (Stacked)")
axs[0].legend()
axs[0].grid(True, axis='y')

# --- Subplot 2: Runtime ---
axs[1].plot(episodes, runtimes, label="Runtime (s)", marker='o', color='orange')
axs[1].axhline(mean_runtime, color='blue', linestyle='--', label=f"Mean: {mean_runtime:.2f}s")
axs[1].fill_between(episodes,
                    mean_runtime - std_runtime,
                    mean_runtime + std_runtime,
                    color='blue',
                    alpha=0.1,
                    label=f"±1 STD: {std_runtime:.2f}")
axs[1].set_ylabel("Time (s)")
axs[1].set_title("Runtime per Episode")
axs[1].legend()
axs[1].grid(True)

# --- Subplot 3: Runtime Mean Summary ---
axs[2].bar(["Runtime"], [mean_runtime], yerr=[std_runtime], capsize=10, color='orange')
axs[2].set_ylabel("Seconds")
axs[2].set_title("Mean Runtime ± STD")
axs[2].grid(axis='y')

# Save and show
plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.savefig(os.path.join(plot_dir, f"{model_name}_summary_subplot.png"))
plt.show()
