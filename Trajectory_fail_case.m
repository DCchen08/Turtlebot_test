clear all
clc
close all   

% Fail case
trajectory_fail = xlsread('Trajectory Fail Case.xlsx');
color_fail = [randi([0 10])/10,randi([0 10])/10,randi([0 10])/10];
position_x_controller_1= trajectory_fail(:,1);
position_y_controller_1 = trajectory_fail(:,2);

theta = deg2rad(0);
position_x_controller_1 = position_x_controller_1*cos(-theta) + position_y_controller_1*sin(-theta);
position_y_controller_1 = position_y_controller_1*cos(-theta) - position_x_controller_1*sin(-theta);

plot(position_x_controller_1,position_y_controller_1,'Color',color_fail,'LineWidth',1)
hold on
legend_str = ['Trajectory Fail Case'];
legend(legend_str,'location','NorthEastOutside');
legend show
plot(position_x_controller_1(1),position_y_controller_1(1),'o','MarkerFaceColor',color_fail,'HandleVisibility','off')
hold on
plot(position_x_controller_1(find(~isnan(position_x_controller_1),1,'last')),position_y_controller_1(find(~isnan(position_y_controller_1),1,'last')),'o','MarkerFaceColor',color_fail,'HandleVisibility','off')
hold on


rectangle('Position',[0.5 1.5 0.15 0.36],'FaceColor','b','LineWidth',1)
hold on
% rectangle('Position',[3.4 3.25 0.15 0.36],'FaceColor','b','LineWidth',1)
% hold on
rectangle('Position',[0.5 -0.5 0.15 0.36],'FaceColor','b','LineWidth',1)
hold on
rectangle('Position',[1.5 0.5 0.15 0.36],'FaceColor','b','LineWidth',1)
hold on
rectangle('Position',[-0.5 -0.5 1 1],'EdgeColor','k','LineWidth',3)
hold on
rectangle('Position',[0.5 0.5 1 1],'EdgeColor','k','LineWidth',3)
hold on
rectangle('Position',[2.95 2.95 0.1 0.1],'EdgeColor','k','LineWidth',1)
hold on
xlabel('x')
ylabel('y')
title('Robot Trajectory Fail Case')
axis([-0.5 4 -0.5 4])

frame = getframe(gcf); 
im = frame2im(frame); 
imwrite(im,'Trajectory_list_Fail.png'); 
