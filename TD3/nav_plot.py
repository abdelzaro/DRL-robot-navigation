import sys
import os
import csv
import matplotlib.pyplot as plt

if len(sys.argv) != 3:
    print("Usage: python nav_plot.py <model_name> <plot_dir>")
    sys.exit(1)

model_name = sys.argv[1]
plot_dir = sys.argv[2]

# Construct path to CSV file
csv_path = os.path.join("/home/asus/DRL-robot-navigation/TD3/nav_data", f"run_stats_{model_name}.csv")

# Create plot_dir if needed
os.makedirs(plot_dir, exist_ok=True)

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


# Create subplots
fig, axs = plt.subplots(3, 1, figsize=(10, 12))
fig.suptitle("Episode Performance Metrics", fontsize=16)

# --- Subplot 1: Collisions ---
axs[0].plot(episodes, collisions, label="Collisions", marker='x', color='red')
axs[0].set_ylabel("Collisions")
axs[0].set_title("Collisions per Episode")
axs[0].grid(True)

# --- Subplot 2: Runtime ---
axs[1].plot(episodes, runtimes, label="Runtime (s)", marker='o', color='orange')
axs[1].set_ylabel("Time (s)")
axs[1].set_title("Runtime per Episode")
axs[1].grid(True)

# --- Subplot 3: Success ---
axs[2].plot(episodes, successes, label="Success", marker='o', linestyle='', color='green')
axs[2].set_xlabel("Episode")
axs[2].set_ylabel("Success (0/1)")
axs[2].set_title("Success per Episode")
axs[2].set_yticks([0, 1])
axs[2].grid(True)

plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.savefig(os.path.join(plot_dir, f"{model_name}_summary_subplot.png"))
plt.show()
