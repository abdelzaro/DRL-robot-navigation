# -*- coding: utf-8 -*-
from __future__ import print_function

import os
import stat
import sys

# find the import for catkin's python package - either from source space or from an installed underlay
if os.path.exists(os.path.join('/opt/ros/noetic/share/catkin/cmake', 'catkinConfig.cmake.in')):
    sys.path.insert(0, os.path.join('/opt/ros/noetic/share/catkin/cmake', '..', 'python'))
try:
    from catkin.environment_cache import generate_environment_script
except ImportError:
    # search for catkin package in all workspaces and prepend to path
    for workspace in '/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/global_planner_setup;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/velodyne_simulator;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/velodyne_gazebo_plugins;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/velodyne_description;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_visualizer;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_simulator;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_sensors;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_utils;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_srvs;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_ros;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_gazebo_plugin;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/dynamic_gap;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_msgs;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim;/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/multi_robot_scenario;/opt/ros/noetic'.split(';'):
        python_path = os.path.join(workspace, 'lib/python3/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/p14/DRL-robot-navigation/catkin_ws/devel_isolated/velodyne_gazebo_plugins/env.sh')

output_filename = '/home/p14/DRL-robot-navigation/catkin_ws/build_isolated/velodyne_gazebo_plugins/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    # print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
