important note, this specific branch is just for debugging and driving teleop. I didn't finish working with it bc going to work on lit review - 20250909

the teleop command: 
```shell
rosrun teleop_twist_keyboard teleop_twist_keyboard.py cmd_vel:=/r1/cmd_vel
```

All at once: 
```shell
source env/bin/activate
cd ~/DRL-robot-navigation/catkin_ws
catkin_make_isolated
export ROS_HOSTNAME=localhost
export ROS_MASTER_URI=http://localhost:11311
export ROS_PORT_SIM=11311
export GAZEBO_RESOURCE_PATH=~/DRL-robot-navigation/catkin_ws/src/multi_robot_scenario/launch
source ~/.bashrc
cd ~/DRL-robot-navigation/catkin_ws
source devel_isolated/setup.bash
cd ~/DRL-robot-navigation/TD3
python3 train_velodyne_td3.py

```

```shell
source env/bin/activate
cd ~/DRL-robot-navigation/catkin_ws
catkin_make_isolated
export ROS_HOSTNAME=localhost
export ROS_MASTER_URI=http://localhost:11311
export ROS_PORT_SIM=11311
export GAZEBO_RESOURCE_PATH=~/DRL-robot-navigation/catkin_ws/src/multi_robot_scenario/launch
source ~/.bashrc
cd ~/DRL-robot-navigation/catkin_ws
source devel_isolated/setup.bash

```



Launch move_base with your config
```shell
roslaunch global_planner_setup move_base.launch
```

this is the current way to set the global plan goal position: 
```shell
rostopic pub /move_base_simple/goal geometry_msgs/PoseStamped "header: {frame_id: 'odom'}
pose:
  position: {x: 4.0, y: 4.0, z: 0.0}
  orientation: {z: 0.0, w: 1.0}"
```

run map: 
```shell
rosrun map_server map_server ~/DRL-robot-navigation/catkin_ws/src/global_planner_setup/maps/map_house.yaml
```

Start localization (AMCL)
(assuming you have a laser publishing /r1/front_laser/scan and base_link)
```shell
rosrun amcl amcl scan:=/r1/front_laser/scan
```

```shell
 rosrun tf static_transform_publisher 0 0 0 0 0 0 base_link base_footprint 100
```

```shell
rosrun tf static_transform_publisher 0 0 0 0 0 0 front_laser base_scan 100
```

why are these needed? 
this code has:

odom → base_link → chassis → front_laser


TurtleBot3 navigation expects:
map → odom → base_footprint → base_scan


So there are two mismatches:
 don’t have base_footprint at all (root is base_link/chassis).
 laser frame is front_laser, but navigation defaults to base_scan.

abdel: some extra commands if gazebo won't cose
```shell
 killall -9 rosout roslaunch rosmaster gzserver nodelet robot_state_publisher gzclient python python3
pkill -9 -f ros
pkill -9 -f gzserver
pkill -9 -f gzclient
```





Open a terminal and set up sources:
```shell
export ROS_HOSTNAME=localhost
export ROS_MASTER_URI=http://localhost:11311
export ROS_PORT_SIM=11311
export GAZEBO_RESOURCE_PATH=~/DRL-robot-navigation/catkin_ws/src/multi_robot_scenario/launch
source ~/.bashrc
cd ~/DRL-robot-navigation/catkin_ws
source devel_isolated/setup.bash

```

Run the training:
```shell
cd ~/DRL-robot-navigation/TD3
python3 train_velodyne_td3.py
```
if using dynamic_gap make sure you launch the gap detection publisher:
```shell
roslaunch dynamic_gap gap_streamer.launch
```
