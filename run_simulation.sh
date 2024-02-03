# Print the current working directory and list its contents
  pwd
  ls -al

  # Show the environment variables that contain the text 'ROS'
  source /home/user/catkin_ws/devel/setup.bash
  env | grep ROS

  # Start the ROS script that MOVES the robot around in the background
  # Capture the process ID of that script in MOVE_ID
  # Wait for 30 seconds and then kill the process
  
  roslaunch tortoisebot_gazebo tortoisebot_playground.launch &
  MOVE_ID=$!
  sleep 30s
  kill $MOVE_ID

  # Call the Gazebo service that resets the simulation
  rosservice call /gazebo/reset_simulation "{}"

  # Print the text that indicates that we are done here
  echo "Job finished"