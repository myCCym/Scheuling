function createplotfig(X1, YMatrix1)
%CREATEFIGURE2(X1, YMatrix1)
%  X1:  semilogy x 数据的向量
%  YMATRIX1:  semilogy y 数据的矩阵

%  由 MATLAB 于 28-Aug-2022 23:29:25 自动生成

% 创建 figure
figure;

% 创建 axes
axes1 = axes('Position',[0.116015132408575 0.11 0.788984867591424 0.815]);
hold(axes1,'on');

% 使用 semilogy 的矩阵输入创建多个 line 对象
semilogy1 = plot(X1,YMatrix1,'LineWidth',2);
set(semilogy1(1),'DisplayName','With Flexibility');
set(semilogy1(2),'DisplayName','No Flexibility');

% 创建 ylabel
ylabel({'Execution Time'},'FontSize',24,'FontName','Times New Roman');

% 创建 xlabel
xlabel({'Number of Jobs'},'FontSize',24,'FontName','Times New Roman');

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'XTick',...
    [0 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000],...
    'YScale','log');
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,'Location','northwest','FontSize',20,...
    'FontName','Times New Roman');

