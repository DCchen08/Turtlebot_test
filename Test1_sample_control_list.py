#!/usr/bin/env python

import time
import rospy
import math
from geometry_msgs.msg import Twist,PoseStamped
from nav_msgs.msg import Odometry,Path
from array import *

global x,y,path_record

class Test1():
    def __init__(self):
        global path_record
        rospy.init_node('Test1', anonymous=False)
        rospy.loginfo("To stop TurtleBot CTRL + C")
        rospy.on_shutdown(self.shutdown)
        self.cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
        rospy.Subscriber('/odom',Odometry,self.callback)
        r = rospy.Rate(10)
        move_cmd = Twist()

        controlist = [[ 0.22,-0.01 ],
                      [ 0.22,-0.01],
                      [ 0.22,-0.01],
                      [ 0.22,-0.01],
                      [0.22,-0.01],
                      [ 0.22,-0.01],
                      [ 0.22,-0.01],
                      [ 0.22,-0.01]]


        con_counter = 0

        start = time.time()
        while not rospy.is_shutdown():
            if con_counter<=len(controlist)-1:
 
                move_cmd.linear.x = controlist[con_counter][0]     #putting the linear speed from control list
                move_cmd.angular.z = controlist[con_counter][1]    #putting the angular speed from control list
                self.cmd_vel.publish(move_cmd)  #publishing the speed
                end = time.time()
                if 1.01>=end-start>=0.99:      #control how much time for each control list running
                  con_counter += 1
                  start = end
                # if con_counter == len(controlist)-1:
                #   if 0.81>=end-start>=0.79:
                #     print(end-start)
                #     con_counter+=1
                #     start = end
                 
            
            else:
              move_cmd.linear.x = 0.00    #stopping the robot
              move_cmd.angular.z = 0
              self.cmd_vel.publish(move_cmd)   
              quit()
              
            r.sleep()


    def shutdown(self):
        rospy.loginfo("Stop TurtleBot")
        self.cmd_vel.publish(Twist())
        rospy.sleep(1)
    def callback(self,msg):
        global x,y,path_record
        x = msg.pose.pose.position.x  #car frame x
        y = msg.pose.pose.position.y  #car frame y
        theta = -135  # starting angle relative to world frame
        position_x_change = x*math.cos(-math.radians(theta)) + y*math.sin(-math.radians(theta))   #world frame x
        position_y_change = y*math.cos(-math.radians(theta)) - x*math.sin(-math.radians(theta))   #world frame y
        #with open("Trajectory_controller_0.txt", "a") as f:
        #        print(position_x_change,",",position_y_change, file=f)
        #f.close()
        #print("our x location is ",position_x_change, " our y location is ", position_y_change)


if __name__ == '__main__':
	Test1()

