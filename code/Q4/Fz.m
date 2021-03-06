%Q4仿真模型
clc,clear,clf;
TEXT = [];

for k = 1:100
    
    
    timeStart = 8;
    timeEnd = 16;
    
    iFlag = 0;    % -1代表候车区候车 0代表接客中 1代表送客中
    
    Tst = 0.003;    % 每一辆车所需要的时间 若前面有x辆车则等Tst*x
    
    earnMoney = 0;    %赚的总钱数
    
    %passinger = 100;    %每趟飞机下来100个乘客 分给25辆车
    
    iChange = 1;    % 1表示刚好突变状态 0表示维持原状态
    
    timeList = [];
    %仿真前初始化
    
    
    for time = timeStart:0.001:timeEnd
        %参数获取环节
        [flightPoint,shortTerm,longTerm,shortGet,longGet] = para(time);
        flightPoint = abs(flightPoint);
        
        if iFlag == -1
            if iChange == 1
                iChange = 0;
                waitTime = flightPoint * 20;
                waitFlag = 1000*waitTime;
            else
                if waitFlag < 0
                    iChange = 1;
                    iFlag = 0;
                else
                    waitFlag = waitFlag - 1;
                    timeList = [timeList,iFlag];
%                     plot(time,iFlag,'.r');
%                     hold on;
                    continue;
                end
            end
        elseif iFlag == 0
            if iChange == 1
                iChange = 0;
                waitTime = ceil(rand*100)*Tst;
                waitFlag = 1000*waitTime;
            else
                if waitFlag < 0
                    iChange = 1;
                    iFlag = 1;
                else
                    waitFlag = waitFlag - 1;
                    timeList = [timeList,iFlag];
%                     plot(time,iFlag,'.b');
%                     hold on;
                    continue;
                end
            end
        else
            if iChange == 1
                iChange = 0;
                waitTime = shortTerm;
                waitFlag = 1000*waitTime;
                earnMoney = earnMoney + shortGet;
            else
                if waitFlag < 0
                    iChange = 1;
                    iFlag = -1;
                else
                    waitFlag = waitFlag - 1;
                    timeList = [timeList,iFlag];
%                     plot(time,iFlag,'.g');
%                     hold on;
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
    k
    earnMoney
    % time_1/size(timeList,2)
    % time0/size(timeList,2)
    % time1/size(timeList,2)
    
    TEXT = [TEXT;earnMoney,time_1/size(timeList,2),time0/size(timeList,2),time1/size(timeList,2)];
    
end



