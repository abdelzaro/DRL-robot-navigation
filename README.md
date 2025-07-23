```shell
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
roslaunch ~/DRL-robot-navigation/TD3/assets/multi_robot_scenario.launch
```
```shell
rosrun teleop_twist_keyboard teleop_twist_keyboard.py /cmd_vel:=r1/cmd_vel
```

```shell
 killall -9 rosout roslaunch rosmaster gzserver nodelet robot_state_publisher gzclient python python3
pkill -9 -f ros
pkill -9 -f gzserver
pkill -9 -f gzclient
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

To check the training process on tensorboard:
```shell
$ cd ~/DRL-robot-navigation/TD3
$ tensorboard --logdir runs
```


Once training is completed, test the model:
```shell
$ cd ~/DRL-robot-navigation/TD3
$ python3 test_velodyne_td3.py
```

Gazebo environment:
<p align="center">
    <img width=80% src="https://github.com/reiniscimurs/DRL-robot-navigation/blob/main/env1.png">
</p>

Rviz:
<p align="center">
    <img width=80% src="https://github.com/reiniscimurs/DRL-robot-navigation/blob/main/velodyne.png">
</p>

