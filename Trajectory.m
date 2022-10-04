clear all;
clc;
close all;

trajectory = xlsread('trajectory.xlsx');

colume_num = 1;  %%should be 1
controller_num = 1;
color_num = 1;
%color = [randi([0 10])/10,randi([0 10])/10,randi([0 10])/10];
color = [randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;  %smaller range
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;  %Wider range
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10;
         randi([0 10])/10,randi([0 10])/10,randi([0 10])/10];

theta = deg2rad(0);

while(color_num <= 2)
    position_x_controller_1= trajectory(:,colume_num);
    colume_num = colume_num + 1;
    position_y_controller_1 = trajectory(:,colume_num);
    colume_num = colume_num + 1;
    position_x_controller_0 = trajectory(:,colume_num);
    colume_num = colume_num + 1;
    position_y_controller_0 = trajectory(:,colume_num);
    colume_num = colume_num + 1;
    position_x_controller_1 = position_x_controller_1*cos(-theta) + position_y_controller_1*sin(-theta);
    position_y_controller_1 = position_y_controller_1*cos(-theta) - position_x_controller_1*sin(-theta);
    position_x_controller_0 = position_x_controller_0*cos(-theta) + position_y_controller_0*sin(-theta);
    position_y_controller_0 = position_y_controller_0*cos(-theta) - position_x_controller_0*sin(-theta);
    plot(position_x_controller_1,position_y_controller_1,'Color',color(color_num,:),'LineWidth',1)
    legend_str{color_num} = ['Trajectory',num2str(color_num)];
    legend(legend_str,'location','NorthEastOutside')
    hold on
    plot(position_x_controller_0,position_y_controller_0,'Color',color(color_num,:),'LineWidth',1,'HandleVisibility','off')
    hold on
    plot(position_x_controller_1(1),position_y_controller_1(1),'o','MarkerFaceColor',color(color_num,:),'HandleVisibility','off')
    hold on
    plot(position_x_controller_1(find(~isnan(position_x_controller_1),1,'last')),position_y_controller_1(find(~isnan(position_y_controller_1),1,'last')),'o','MarkerFaceColor',color(color_num,:),'HandleVisibility','off')
    hold on
    plot(position_x_controller_0(find(~isnan(position_x_controller_0),1,'last')),position_y_controller_0(find(~isnan(position_y_controller_0),1,'last')),'o','MarkerFaceColor',color(color_num,:),'HandleVisibility','off')
    hold on
    color_num = color_num + 1;
end





rectangle('Position',[0.5 1.5 0.15 0.36],'FaceColor','b','LineWidth',1)
hold on
%rectangle('Position',[3.4 3.25 0.15 0.36],'FaceColor','b','LineWidth',1)
%hold on
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
title('Robot Trajectory')
%axis([-0.5 4 -0.5 4])

frame = getframe(gcf); 
im = frame2im(frame); 
imwrite(im,'Trajectory_list.png'); 




