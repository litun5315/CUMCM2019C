%第四问 情况1
%单独计算一个普通司机工作一天的情况（既有可能接到长途也有可能接到短途）
clc,clear,clf;

ALL = [];

for stT = 0.01:0.01:0.50
    
    TEXT = [];
    
    for r=1:100
        
        timeStart = 8;
        timeEnd = 16;
        
        iFlag = 0;    % -1代表候车区候车 0代表接客中 1代表送客中
        
        Tst = stT;    % 每一辆车所需要的时间 若前面有x辆车则等Tst*x
        
        earnMoney = 0;    %赚的总钱数
        
        iChange = 1;    % 1表示刚好突变状态 0表示维持原状态
        
        timeList = [];
        %仿真前初始化
        
        for time = timeStart:0.01:timeEnd
            %参数获取环节
            [flightPoint,shortTerm,longTerm,shortGet,longGet] = para(time);
            flightPoint = abs(flightPoint);
            
            if iFlag == -1
                if iChange == 1
                    iChange = 0;
                    waitTime = flightPoint * 20;
                    waitFlag = 100*waitTime;
                else
                    if waitFlag < 0
                        iChange = 1;
                        iFlag = 0;
                    else
                        waitFlag = waitFlag - 1;
                        timeList = [timeList,iFlag];
                        %plot(time,iFlag,'.r');
                        %hold on;
                        continue;
                    end
                end
            elseif iFlag == 0
                if iChange == 1
                    iChange = 0;
                    waitTime = ceil(rand*100)*Tst;
                    waitFlag = 100*waitTime;
                else
                    if waitFlag < 0
                        iChange = 1;
                        iFlag = 1;
                    else
                        waitFlag = waitFlag - 1;
                        timeList = [timeList,iFlag];
                        %plot(time,iFlag,'.b');
                        %hold on;
                        continue;
                    end
                end
            else
                if iChange == 1
                    iChange = 0;
                    if rand > 0.5
                        waitTime = longTerm;
                        waitFlag = 100*waitTime;
                        earnMoney = earnMoney + longGet;
                    else
                        waitTime = shortTerm;
                        waitFlag = 100*waitTime;
                        earnMoney = earnMoney + shortGet;
                    end
                else
                    if waitFlag < 0
                        iChange = 1;
                        iFlag = -1;
                    else
                        waitFlag = waitFlag - 1;
                        timeList = [timeList,iFlag];
                        %plot(time,iFlag,'.g');
                        %hold on;
                        continue;
                    end
                end
            end
        end
        
        time_1 = 0;
        time0 = 0;
        time1 = 0;
        for i = 1:size(timeList,2)
            if timeList(i)==-1
                time_1 = time_1 + 1;
            elseif timeList(i)==0
                time0 = time0 +1;
            else
                time1 = time1 + 1;
            end
        end
        
        r
        TEXT = [TEXT;earnMoney];

    end
    
    ALL = [ALL,TEXT];

end

stdPoint = [];
for i=1:50
    stdPoint = [stdPoint,std(ALL(:,i))];
end

i=0.01:0.01:0.50
%plot(i,stdPoint);

p = polyfit(i,stdPoint,3);

x1 =0.01:0.01:0.50;% linspace(0.01:0.01:0.50);
y1 = polyval(p,x1);
plot(i,stdPoint,'.')
hold on
plot(x1,y1)
title('司机收益标准差与乘客上车所用时间的关系图');
xlabel('乘客上车所用时间（h）');
ylabel('司机收益标准差（元）');

hold off