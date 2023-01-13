function createacgcostfunc(X1, YMatrix1)
%CREATEFIGURE2(X1, YMatrix1)
%  X1:  plot x 数据的向量
%  YMATRIX1:  plot y 数据的矩阵

%  由 MATLAB 于 13-Sep-2022 00:25:26 自动生成

% 创建 figure
figure;

% 创建 axes
axes1 = axes('Position',[0.116015132408575 0.11 0.788984867591424 0.815]);
hold(axes1,'on');

% 使用 plot 的矩阵输入创建多个 line 对象
plot1 = plot(X1,YMatrix1,'LineWidth',2);
set(plot1(1),'DisplayName','With Flexibility');
set(plot1(2),'DisplayName','No Flexibility');

% 创建 ylabel
ylabel({'Average Unit Load Cost'},'FontSize',24,...
    'FontName','Times New Roman');

% 创建 xlabel
xlabel({'Number of Jobs'},'FontSize',24,'FontName','Times New Roman');

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'XTick',...
    [0 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000]);
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.153727180136649 0.819820987825509 0.177859391395593 0.0734421364985164],...
    'FontSize',20,...
    'FontName','Times New Roman');

