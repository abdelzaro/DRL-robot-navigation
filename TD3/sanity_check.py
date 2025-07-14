import rospy
import time

rospy.init_node("time_check")

while not rospy.is_shutdown():
    sim_time = rospy.Time.now().to_sec()
    wall_time = time.time()
    print(f"ROS Time: {sim_time:.2f}, Wall Time: {wall_time:.2f}, Diff: {abs(sim_time - wall_time):.2f}")
    rospy.sleep(1.0)
