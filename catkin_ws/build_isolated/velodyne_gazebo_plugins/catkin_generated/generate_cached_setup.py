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
    for workspace in '/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/velodyne_description;/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_visualizer;/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_simulator;/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_sensors;/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_utils;/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_srvs;/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_ros;/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_gazebo_plugin;/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/dynamic_gap;/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim_msgs;/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/pedsim;/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/multi_robot_scenario;/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/global_planner_setup;/opt/ros/noetic'.split(';'):
        python_path = os.path.join(workspace, 'lib/python3/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/az/DRL-robot-navigation/catkin_ws/devel_isolated/velodyne_gazebo_plugins/env.sh')

output_filename = '/home/az/DRL-robot-navigation/catkin_ws/build_isolated/velodyne_gazebo_plugins/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    # print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
