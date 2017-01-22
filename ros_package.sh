#!/bin/sh
sudo -E sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo -E apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116

sudo apt-get update
sudo -E apt-get install -y ros-indigo-desktop-full
sudo -E apt-get install -y python-wstool python-catkin-tools
sudo -E apt-get install -y ros-indigo-moveit-full

sudo -E rosdep init
rosdep update

source /opt/ros/indigo/setup.bash

exit
