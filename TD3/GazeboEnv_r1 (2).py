import math, os, random, subprocess, time
from os import path
import numpy as np, rospy, sensor_msgs.point_cloud2 as pc2
from dynamic_gap.msg import GapPolarArray
from gazebo_msgs.msg import ModelState
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from sensor_msgs.msg import PointCloud2
from squaternion import Quaternion
from std_srvs.srv import Empty
from visualization_msgs.msg import Marker, MarkerArray

GOAL_REACHED_DIST = 0.3
COLLISION_DIST = 0.35
TIME_DELTA = 0.1

def check_pos(x,y):
    # same obstacle-check code...
    goal_ok=True
    if -3.8> x >-6.2 and 6.2>y>3.8: goal_ok=False
    if -1.3> x >-2.7 and 4.7>y>-0.2: goal_ok=False
    if -0.3> x >-4.2 and 2.7>y>1.3: goal_ok=False
    if -0.8> x >-4.2 and -2.3>y>-4.2: goal_ok=False
    if -1.3> x >-3.7 and -0.8>y>-2.7: goal_ok=False
    if 4.2> x >0.8 and -1.8>y>-3.2: goal_ok=False
    if 4> x >2.5 and 0.7>y>-3.2: goal_ok=False
    if 6.2> x >3.8 and -3.3>y>-4.2: goal_ok=False
    if 4.2> x >1.3 and 3.7>y>1.5: goal_ok=False
    if -3.0> x >-7.2 and 0.5>y>-1.5: goal_ok=False
    if x>4.5 or x<-4.5 or y>4.5 or y<-4.5: goal_ok=False
    return goal_ok

class GazeboEnv:
    def __init__(self, launchfile, environment_dim):
        self.environment_dim = environment_dim
        self.odom_x = self.odom_y = 0.0
        self.goal_x, self.goal_y = 1.0, 0.0
        self.upper, self.lower = 5.0, -5.0
        self.velodyne_data = np.ones(environment_dim)*10
        self.last_odom=None

        self.set_self_state = ModelState()
        self.set_self_state.model_name = "r1"
        self.set_self_state.pose.orientation.w = 1.0

        # angular bins
        self.gaps=[[ -math.pi/2-0.03, -math.pi/2+math.pi/environment_dim ]]
        for _ in range(environment_dim-1):
            lo=self.gaps[-1][1]
            self.gaps.append([lo, lo+math.pi/environment_dim])
        self.gaps[-1][-1]+=0.03
        self.dgap_flat_vector=np.zeros(20,dtype=np.float32)

        subprocess.Popen(["roscore","-p","11311"])
        rospy.init_node("gym_r1", anonymous=True)

        if not launchfile.startswith("/"):
            launchfile=path.join(path.dirname(__file__),"assets",launchfile)
        subprocess.Popen(["roslaunch","-p","11311",launchfile])

        self.vel_pub= rospy.Publisher("/r1/cmd_vel", Twist, queue_size=1)
        self.set_state=rospy.Publisher("gazebo/set_model_state", ModelState, queue_size=10)
        self.unpause=rospy.ServiceProxy("/gazebo/unpause_physics", Empty)
        self.pause=rospy.ServiceProxy("/gazebo/pause_physics", Empty)
        self.reset_proxy=rospy.ServiceProxy("/gazebo/reset_world", Empty)

        self.publisher = rospy.Publisher("/r1/goal_point", MarkerArray, queue_size=3)
        self.publisher2= rospy.Publisher("/r1/linear_velocity", MarkerArray, queue_size=1)
        self.publisher3= rospy.Publisher("/r1/angular_velocity", MarkerArray, queue_size=1)

        rospy.Subscriber("/r1/velodyne_points", PointCloud2, self.velodyne_callback, queue_size=1)
        rospy.Subscriber("/r1/odom", Odometry, self.odom_callback, queue_size=1)
        rospy.Subscriber("/r1/simplified_gaps", GapPolarArray, self.gaps_callback, queue_size=1)
    # ----- (rest of methods identical to original, omitted for brevity) -----
