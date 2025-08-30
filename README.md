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


```shell
roslaunch global_planner_setup move_base_global.launch
```

this is the current way to set the global plan goal position: 
```shell
rostopic pub /move_base_simple/goal geometry_msgs/PoseStamped "header: {frame_id: 'odom'}
pose:
  position: {x: 4.0, y: 4.0, z: 0.0}
  orientation: {z: 0.0, w: 1.0}"
```

adjusting this will also adjust where the global and local costmaps are:
```shell
rosrun tf static_transform_publisher 5 5 0 0 0 0 map odom 100
```

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
