# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/include/eigen3;/home/mini/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_msgs/include;/opt/ros/noetic/include;/opt/ros/noetic/share/xmlrpcpp/cmake/../../../include/xmlrpcpp;/usr/include".split(';') if "${prefix}/include;/usr/include/eigen3;/home/mini/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_msgs/include;/opt/ros/noetic/include;/opt/ros/noetic/share/xmlrpcpp/cmake/../../../include/xmlrpcpp;/usr/include" != "" else []
PROJECT_CATKIN_DEPENDS = "base_local_planner;pluginlib;roscpp;rospy;pedsim_msgs;dynamic_reconfigure;message_generation;std_msgs;sensor_msgs;geometry_msgs;message_runtime;std_msgs;geometry_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-ldynamic_gap".split(';') if "-ldynamic_gap" != "" else []
PROJECT_NAME = "dynamic_gap"
PROJECT_SPACE_DIR = "/home/mini/DRL-robot-navigation/catkin_ws/install_isolated"
PROJECT_VERSION = "0.0.0"
