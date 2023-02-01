# Turtlebot_test

Environment: ROS(Noetic), turtlebot(waffle_pi), Ubuntu

1. Installing the package following with this link.

  https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start/

2. Connecting with the Wifi

3. In command window, run roscore.

roscore

4. In the another command window, connect to Raspberry Pi with its IP address.

  ssh ubuntu@{168.161.0.160}
  pw:turtlebot

5. Bring up basic packages to start TurtleBot3 applications

  export TURTLEBOT3_MODEL=${waffle_pi}
  roslaunch turtlebot3_bringup turtlebot3_robot.launch

reference: https://emanual.robotis.com/docs/en/platform/turtlebot3/bringup/#bringup



