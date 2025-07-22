## moving to the top so can find easier

without env Parallel instructions: 
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
python3 train_velodyne_td3.py
```

```shell
 killall -9 rosout roslaunch rosmaster gzserver nodelet robot_state_publisher gzclient python python3
pkill -9 -f ros
pkill -9 -f gzserver
pkill -9 -f gzclient
```

if using dynamic_gap make sure you launch the gap detection publisher:
```shell
roslaunch dynamic_gap gap_streamer.launch
```

To test the code. example of yourFIle is TD3_velodyne_run5_5gap_width_normalized_x5speed: 
```shell
model=$(python3 high_reward.py yourFile)
```
you don't need to change:
```shell
python3 improved_test_velodyne_td3.py $model
```


**Installation and code overview tutorial available** [here](https://medium.com/@reinis_86651/deep-reinforcement-learning-in-mobile-robot-navigation-tutorial-part1-installation-d62715722303)

Training example:
<p align="center">
    <img width=100% src="https://github.com/reiniscimurs/DRL-robot-navigation/blob/main/training.gif">
</p>



**ICRA 2022 and IEEE RA-L paper:**


Some more information about the implementation is available [here](https://ieeexplore.ieee.org/document/9645287?source=authoralert)



## Installation

Compile the workspace:
```shell
$ cd ~/DRL-robot-navigation/catkin_ws
### Compile
$ catkin_make_isolated
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


To check the training process on tensorboard:
```shell
$ cd ~/DRL-robot-navigation/TD3
$ tensorboard --logdir runs
```

To kill the training process:
```shell
 killall -9 rosout roslaunch rosmaster gzserver nodelet robot_state_publisher gzclient python python3
```
abdel: some extra commands if gazebo won't cose
```shell
 killall -9 rosout roslaunch rosmaster gzserver nodelet robot_state_publisher gzclient python python3
pkill -9 -f ros
pkill -9 -f gzserver
pkill -9 -f gzclient
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

