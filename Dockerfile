# Start from ROS base image
FROM osrf/ros:noetic-desktop-full

# Make a catkin workspace
WORKDIR /
RUN mkdir -p /simulation_ws/src
WORKDIR /simulation_ws/src

# Install Git
RUN apt-get update && apt-get install -y git

COPY tortoisebot /simulation_ws/src/tortoisebot

WORKDIR /simulation_ws

# Build your ROS packages
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash; cd /simulation_ws; catkin_make"

# Source the workspace every time a new shell is opened in the container
RUN echo source /simulation_ws/devel/setup.bash >> ~/.bashrc

# Set the entry point to start a bash shell
CMD /bin/bash -c "source /simulation_ws/devel/setup.bash; rostest tortoisebot_waypoints waypoints_test.test"