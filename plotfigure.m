function plotfigure(X1, YMatrix1)
%CREATEFIGURE2(X1, YMatrix1)
%  X1:  plot x 数据的向量
%  YMATRIX1:  plot y 数据的矩阵

%  由 MATLAB 于 05-Oct-2022 00:42:54 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 使用 plot 的矩阵输入创建多个 line 对象
plot1 = plot(X1,YMatrix1,'Marker','o','LineWidth',2);
set(plot1(1),'DisplayName','Our Algorithm');
set(plot1(2),'DisplayName','CVX Integer Solver');

% 创建 ylabel
ylabel({'Scheduled Load'},'FontSize',24,'FontName','Times New Roman');

% 创建 xlabel
xlabel({'Time'},'FontSize',24,'FontName','Times New Roman');

% 取消以下行的注释以保留坐标区的 X 范围
% xlim(axes1,[1 24]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'XTick',...
    [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24]);
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,'Location','northwest','FontSize',24,...
    'FontName','Times New Roman');

