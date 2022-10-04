clear all
clc
close all

% Fail case
trajectory_fail = xlsread('Trajectory Oil Case.xlsx');
%trajectory = xlsread('trajectory.xlsx');

color_fail_oil = [randi([0 10])/10,randi([0 10])/10,randi([0 10])/10];
color_success = [randi([0 10])/10,randi([0 10])/10,randi([0 10])/10];
position_x_controller_1= trajectory_fail(:,1);
position_y_controller_1 = trajectory_fail(:,2);
% position_x_controller_1_success = trajectory(:,1);
% position_y_controller_1_success = trajectory(:,2);
% position_x_controller_0_success = trajectory(:,3);
% position_y_controller_0_success = trajectory(:,4);

sb = 1;
initial_x = 3.0146742100611;
initial_y = 3.01197009665295;
if (sb == 1)
    position_x_controller_1 = position_x_controller_1 - initial_x;
    position_y_controller_1 = position_y_controller_1 - initial_y;
    theta = deg2rad(5);
    position_x_controller_1 = position_x_controller_1*cos(-theta) + position_y_controller_1*sin(-theta);
    position_y_controller_1 = position_y_controller_1*cos(-theta) - position_x_controller_1*sin(-theta);
    position_x_controller_1 = position_x_controller_1 + initial_x;
    position_y_controller_1 = position_y_controller_1 + initial_y;
end



% theta_1 =  deg2rad(0);
% position_x_controller_1_success = position_x_controller_1_success*cos(-theta_1) + position_y_controller_1_success*sin(-theta_1);
% position_y_controller_1_success = position_y_controller_1_success*cos(-theta_1) - position_x_controller_1_success*sin(-theta_1);
% position_x_controller_0_success = position_x_controller_0_success*cos(-theta_1) + position_y_controller_0_success*sin(-theta_1);
% position_y_controller_0_success = position_y_controller_0_success*cos(-theta_1) - position_x_controller_0_success*sin(-theta_1);

plot(position_x_controller_1,position_y_controller_1,'Color',color_fail_oil,'LineWidth',1)
hold on

% plot(position_x_controller_1_success,position_y_controller_1_success,'--','Color',color_success,'LineWidth',1)
% hold on
% 
% plot(position_x_controller_0_success,position_y_controller_0_success,'--','Color',color_success,'LineWidth',1)
% hold on
legend_str = ['Trajectory Fail Case with Oil'];
legend_str_1 = ['Trajectory Success Case controller 1'];
legend_str_2 = ['Trajectory Success Case controller 0'];
legend(legend_str,legend_str_1,legend_str_2,'location','NorthEastOutside');
%legend(legend_str_1,'location','NorthEastOutside');
%legend(legend_str_2,'location','NorthEastOutside');
legend show




plot(position_x_controller_1(1),position_y_controller_1(1),'o','MarkerFaceColor',color_fail_oil,'HandleVisibility','off')
hold on
plot(position_x_controller_1(find(~isnan(position_x_controller_1),1,'last')),position_y_controller_1(find(~isnan(position_y_controller_1),1,'last')),'o','MarkerFaceColor',color_fail_oil,'HandleVisibility','off')
hold on
% plot(position_x_controller_1_success(1),position_y_controller_1_success(1),'o','MarkerFaceColor',color_success,'HandleVisibility','off')
% hold on
% plot(position_x_controller_1_success(find(~isnan(position_x_controller_1_success),1,'last')),position_y_controller_1_success(find(~isnan(position_y_controller_1_success),1,'last')),'o','MarkerFaceColor',color_success,'HandleVisibility','off')
% hold on
% plot(position_x_controller_0_success(1),position_y_controller_0_success(1),'o','MarkerFaceColor',color_success,'HandleVisibility','off')
% hold on
% plot(position_x_controller_0_success(find(~isnan(position_x_controller_0_success),1,'last')),position_y_controller_0_success(find(~isnan(position_y_controller_0_success),1,'last')),'o','MarkerFaceColor',color_success,'HandleVisibility','off')
% hold on


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
rectangle('Position',[2.7 2.7 0.2 0.1],'FaceColor','g','LineWidth',1)
xlabel('x')
ylabel('y')
title('Robot Trajectory Fail Case With Oil')
axis([-0.5 4 -0.5 4])

frame = getframe(gcf); 
im = frame2im(frame); 
imwrite(im,'Trajectory_list_Fail_Oil.png'); 
