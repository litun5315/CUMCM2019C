%计算距离
%初始化点的特征
%分别代表了<3km，3~15km，>15km
distan3 = 0;
distan315 = 0;
distan15 = 0;
%获得各个地点坐标数据
point = xlsread('./上海地点坐标.xlsx','Sheet1','P2:Q408824');
%初始化机场坐标
airport = [121.808,31.151];
%地球半径
R = 6371;
for i=1:size(point,1)
    %采用曼哈顿距离
    %使用Haversine的推导公式
    distan_x = abs(2*R * asin( sqrt( sin(0.5*point(i,2)-0.5*airport(2))^2))/100);
    distan_y = abs(2*R * asin( sqrt( cos(point(i,2))^2 * sin(0.5*point(i,1)-0.5*airport(1))^2))/100);
    distan_all = distan_x+distan_y;  
    if distan_all < 3+5
        distan3 = distan3 + 1;
    elseif distan_all <15+5
        distan315 = distan315 +1;
    else distan_all < 30 + 5 
        distan15 = distan15 + 1;
    end
end
%获得每种目的地需求的概率
pro3 = distan3/size(point,1);
pro315 = distan315/size(point,1);
pro15 = distan15/size(point,1)