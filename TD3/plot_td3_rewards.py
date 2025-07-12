import os
import matplotlib.pyplot as plt
import pandas as pd
from tensorboard.backend.event_processing.event_accumulator import EventAccumulator

# Path to the .tfevents file
event_file = '/home/power20/DRL-robot-navigation/TD3/runs/Jul12_08-46-05_pc'  # <-- Update this filename

# Load TensorBoard log
ea = EventAccumulator(event_file)
ea.Reload()

# List all scalar tags (e.g. reward, loss)
print("Available tags:", ea.Tags()['scalars'])

# Plot the reward tag (or use any tag you see printed)
tag = 'loss'  # <-- or 'eval_reward' if that's what your training logs
events = ea.Scalars(tag)
steps = [e.step for e in events]
values = [e.value for e in events]

plt.plot(steps, values, label=tag)
plt.xlabel("Training Step")
plt.ylabel("Reward")
plt.title("TD3 Training Reward Over Time")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()
