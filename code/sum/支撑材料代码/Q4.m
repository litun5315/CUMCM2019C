%第四问仿真
clc,clear,clf;
timeStart = 8;
timeEnd = 16;

iFlag = 0;    % -1代表候车区候车 0代表接客中 1代表送客中

Tst = 0.01;    % 每一辆车所需要的时间 若前面有x辆车则等Tst*x 

earnMoney = 0;    %赚的总钱数

shortTerm = 0.3;
longTerm = 0.6;

shortGet = 5;
longGet = 10;

flightPoint = ceil((1/23)*100)/100;    %每0.5h来一趟飞机
passinger = 100;    %每趟飞机下来100个乘客 分给25辆车

nowpast = ceil(rand*100);

iChange = 1;    % 1表示刚好突变状态 0表示维持原状态

timeList = [];

for time = timeStart:0.01:timeEnd
     if iFlag == -1
         if iChange == 1
             iChange = 0;
             waitTime = flightPoint;
             waitFlag = 100*waitTime;
         else
             if waitFlag == 0
                 iChange = 1;
                 iFlag = 0;
             else
                 waitFlag = waitFlag - 1;
                 timeList = [timeList,iFlag];
                 plot(time,iFlag,'.');
                 hold on;
                 continue;
             end
         end 
     elseif iFlag == 0
         if iChange == 1
             iChange = 0;
             waitTime = ceil(rand*100)*Tst;
             waitFlag = 100*waitTime;
         else
             if waitFlag == 0
                 iChange = 1;
                 iFlag = 1;
             else
                 waitFlag = waitFlag - 1;
                 timeList = [timeList,iFlag];
                 plot(time,iFlag,'.');
                 hold on;
                 continue;
             end
         end 
     else
         if iChange == 1
             iChange = 0;
             waitTime = shortTerm;
             waitFlag = 100*waitTime;
             earnMoney = earnMoney + shortGet;
         else
             if waitFlag == 0
                 iChange = 1;
                 iFlag = -1;
             else
                 waitFlag = waitFlag - 1;
                 timeList = [timeList,iFlag];
                 plot(time,iFlag,'.');
                 hold on;
                 continue;
             end
         end  
     end
end