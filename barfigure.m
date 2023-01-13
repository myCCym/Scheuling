function barfigure(xvector1, ymatrix1)
%CREATEFIGURE2(xvector1, ymatrix1)
%  XVECTOR1:  bar xvector
%  YMATRIX1:  bar 矩阵数据

%  由 MATLAB 于 05-Oct-2022 00:54:08 自动生成

% 创建 figure
figure;

% 创建 axes
axes1 = axes;
hold(axes1,'on');

% 使用 bar 的矩阵输入创建多行
bar1 = bar(xvector1,ymatrix1);
set(bar1(2),'DisplayName','Our Algorithm');
set(bar1(1),'DisplayName','CVX Integer Solver');

% 创建 ylabel
ylabel({'Unit Load Cost'},'FontSize',24,'FontName','Times New Roman');

% 创建 xlabel
xlabel('Number of Jobs','FontSize',24,'FontName','Times New Roman');

% 取消以下行的注释以保留坐标区的 X 范围
% xlim(axes1,[100 4100]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'XTick',...
    [0 200 400 600 800 1000 1200 1400 1600 1800 2000 2200 2400 2600 2800 3000 3200 3400 3600 3800 4000 4200]);
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,'Location','northwest','FontSize',24,...
    'FontName','Times New Roman');

