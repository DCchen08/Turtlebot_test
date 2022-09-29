#!/usr/bin/env python



# A very basic TurtleBot script that moves TurtleBot forward indefinitely. Press CTRL + C to stop.  To run:
# On TurtleBot:
# roslaunch turtlebot_bringup minimal.launch
# On work station:
# python goforward.py

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
        #global x,y
        # initiliaze
        rospy.init_node('Test1', anonymous=False)
	# tell user how to stop TurtleBot
        rospy.loginfo("To stop TurtleBot CTRL + C")

        # What function to call when you ctrl + c
        rospy.on_shutdown(self.shutdown)

	# Create a publisher which can "talk" to TurtleBot and tell it to move
        self.cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
        #self.path_pub = rospy.Publisher('trajectory', Path, queue_size=10)
        #path_record = Path()
        rospy.Subscriber('/odom',Odometry,self.callback)


	#TurtleBot will stop if we don't keep telling it to move.  How often should we tell it to move? 10 HZ
        r = rospy.Rate(10)

        # Twist is a datatype for velocity
        move_cmd = Twist()
	# let's go forward at 0.2 m/s
        #move_cmd.linear.x = 0.20
	# let's turn at 0 radians/s
        #move_cmd.angular.z = 0


        
        controlist = [[0.22, 0.08921288], [0.22, 0.05219005], [0.22, 0.016936377], [0.22, -0.0019766241], [0.22, -0.018085748], [0.22, -0.03357576], [0.22, -0.05182302], [0.21961674, -0.07381378], [0.18707651, -0.09549905], [0.16126572, -0.12119541], [0.1518704, -0.14170808], [0.14747955, -0.15], [0.13067955, -0.15], [0.20208529, -0.15]]
        #counter = 0
        #interv = 10  #maximum time
        #wait = 15    #waiting time
        con_counter = 0
	# as long as you haven't ctrl + c keeping doing...
        start = time.time()
        while not rospy.is_shutdown():
            if con_counter<=len(controlist)-1:
                #if counter < interv:   
	              #publish the velocity
                move_cmd.linear.x = controlist[con_counter][0]  #线速度
                move_cmd.angular.z = controlist[con_counter][1] #角速度   跑1s 2s
                self.cmd_vel.publish(move_cmd)
                
                '''
                elif counter>= interv and counter<wait:
                  move_cmd.linear.x = 0.00
                  move_cmd.angular.z = 0
                  self.cmd_vel.publish(move_cmd)
                  #rospy.loginfo("Stop")
                
        else:
                  #reset time counter
                  counter = -1
                  #move to the next control input
                  con_counter += 1
                  '''

                #update the time counter
                #time.sleep()
                end = time.time()
                #print(end-start) 
                #print(x)
                if 1.01>=end-start>=0.99:   
                  con_counter += 1
                  start = end
                #if con_counter == len(controlist)-1:
                  #if 0.51>=end-start>=0.49:
                    #print(end-start)
                    #con_counter+=1
                    #start = end
                    
                    
            #all comands from controllist have been executed
            
            else:
              move_cmd.linear.x = 0.00
              move_cmd.angular.z = 0
              self.cmd_vel.publish(move_cmd)   
              quit()
              
            r.sleep()


    def shutdown(self):
        # stop turtlebot
        rospy.loginfo("Stop TurtleBot")
	# a default Twist has linear.x of 0 and angular.z of 0.  So it'll stop TurtleBot
        self.cmd_vel.publish(Twist())
	# sleep just makes sure TurtleBot receives the stop command prior to shutting down the script
        rospy.sleep(1)
    def callback(self,msg):
        global x,y,path_record
        x = msg.pose.pose.position.x
        y = msg.pose.pose.position.y
        #if 3.4>= x>=3.31:
          #print("end by command")
          #quit() 
        #position_x = []
        #position_x.append(x)
        #print(position_x)
        #for i in position_x:
          #position_x.append(x)
        
        #q1 = data.pose.pose.orientation.x
        #q2 = data.pose.pose.orientation.y
        #q3 = data.pose.pose.orientation.z
        #q4 = data.pose.pose.orientation.w
        #print(msg.pose.pose) ##忘记怎么写
        theta = -135   #car rotation angle
        position_x_change = x*math.cos(-math.radians(theta)) + y*math.sin(-math.radians(theta))
        position_y_change = y*math.cos(-math.radians(theta)) - x*math.sin(-math.radians(theta)) 
        with open("Trajectory_controller_1.txt", "a") as f:
                print(position_x_change,",",position_y_change, file=f)
        f.close()
        print("our x location is ",position_x_change, " our y location is ", position_y_change)
        #current_time = rospy.Time.now()
        #pose = PoseStamped()
        #pose.header.stamp = current_time
        #pose.header.frame_id = 'odom'
        #pose.pose = msg.pose.pose
        #path_record.header.stamp = current_time
        #path_record.header.frame_id = 'odom'
        #path_record.poses.append(pose)
        #self.path_pub.publish(path_record)
        
        
        

if __name__ == '__main__':
    #try:
        Test1()
        #dist = math.sqrt(x**2 + y**2)
        #print(dist)
        if 5>= x>=4.9 and 5>= y >= 4.9:
            print("robot arrivied")
        else:
            print("not arrivied")
        quit()
            

    #except:
        #rospy.loginfo("GoForward node terminated.")
