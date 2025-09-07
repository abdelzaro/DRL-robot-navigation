#!/usr/bin/env python3
import rospy
import tf
from gazebo_msgs.msg import ModelStates
from geometry_msgs.msg import PoseWithCovarianceStamped

class GroundTruthLocalization:
    def __init__(self):
        self.robot_name = rospy.get_param("~robot_name", "r1")

        # TF broadcaster: publishes map → odom
        self.br = tf.TransformBroadcaster()

        # Optional publisher: fake /amcl_pose
        # self.amcl_pub = rospy.Publisher("/amcl_pose",
        #                                 PoseWithCovarianceStamped,
        #                                 queue_size=1)

        rospy.Subscriber("/gazebo/model_states", ModelStates, self.callback)

    def callback(self, msg):
        # Find robot in model_states
        try:
            idx = msg.name.index(self.robot_name)
        except ValueError:
            rospy.logwarn_throttle(5, f"[GT-Localization] Robot {self.robot_name} not in /gazebo/model_states")
            return

        pose = msg.pose[idx]

        # Broadcast perfect transform map→odom
        self.br.sendTransform(
            (pose.position.x, pose.position.y, pose.position.z),
            (pose.orientation.x, pose.orientation.y, pose.orientation.z, pose.orientation.w),
            rospy.Time.now(),
            "odom",   # child
            "map"     # parent
        )

        # Publish fake amcl_pose (optional, but nice for RViz)
        # amcl_msg = PoseWithCovarianceStamped()
        # amcl_msg.header.stamp = rospy.Time.now()
        # amcl_msg.header.frame_id = "map"
        # amcl_msg.pose.pose = pose
        # amcl_msg.pose.covariance = [0.0]*36  # no uncertainty, since it's ground truth
        # self.amcl_pub.publish(amcl_msg)


if __name__ == "__main__":
    rospy.init_node("ground_truth_localization")
    GroundTruthLocalization()
    rospy.loginfo("[GT-Localization] Node started. Publishing perfect map→odom.")
    rospy.spin()
