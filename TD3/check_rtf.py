#!/usr/bin/env python
import rospy
from rosgraph_msgs.msg import Clock
import time

class RealTimeFactorMonitor:
    def __init__(self):
        rospy.init_node("rtf_monitor", anonymous=True)
        self.last_sim_time = None
        self.last_wall_time = None
        rospy.Subscriber("/clock", Clock, self.clock_callback)
        rospy.spin()

    def clock_callback(self, msg):
        current_sim_time = msg.clock.to_sec()
        current_wall_time = time.time()

        if self.last_sim_time is not None and self.last_wall_time is not None:
            delta_sim = current_sim_time - self.last_sim_time
            delta_wall = current_wall_time - self.last_wall_time
            if delta_wall > 0:
                rtf = delta_sim / delta_wall
                print(f"Sim Time: {current_sim_time:.2f}, Wall Time: {current_wall_time:.2f}, RTF: {rtf:.2f}")

        self.last_sim_time = current_sim_time
        self.last_wall_time = current_wall_time


if __name__ == "__main__":
    RealTimeFactorMonitor()
