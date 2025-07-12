import os
import matplotlib.pyplot as plt
from tensorboard.backend.event_processing.event_accumulator import EventAccumulator

# Full path to TensorBoard log folder
log_dir = '/home/power20/DRL-robot-navigation/TD3/runs/Jul12_08-26-53_pc'

# Load logs
ea = EventAccumulator(log_dir)
ea.Reload()

tags = ea.Tags()['scalars']
print("Available scalar tags:", tags)

# Plot each tag
plt.figure(figsize=(12, 4 * len(tags)))
for i, tag in enumerate(tags, 1):
    events = ea.Scalars(tag)
    steps = [e.step for e in events]
    values = [e.value for e in events]
    plt.subplot(len(tags), 1, i)
    plt.plot(steps, values)
    plt.title(tag)
    plt.xlabel("Step")
    plt.ylabel("Value")
    plt.grid(True)

plt.tight_layout()
plt.show()
