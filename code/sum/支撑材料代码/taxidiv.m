 %初始化数据
 clc,clear;
 
 taxiDriver = xlsread('Taxi_105.xlsx','Taxi_105','C1:D1238');
 passinger = xlsread('Taxi_105.xlsx','Taxi_105','G1:G1823');
 iFlag = 0;
 timeList = size(taxiDriver,1);
 iChange = 0;
 
 earnMoney = [];    % 赚钱列表
 moneyTime = [];    % 赚钱时间
 wallet = 0;    % 单次开车赚的钱
 
 nullDrive = 0;    % 日常开车
 moneyDrive = 0;    % 有钱的开车
 
 areaBefore = taxiDriver(1,:);
 
 moringMoney = 0;
 moringPoint = 0;
 eveningMOney = 0;
 eveningMoney = 0;
 
 for i=2:timeList
     
     areaAfter = taxiDriver(i,:);
     
     addDistan = distanGet(areaBefore(1),areaBefore(2),areaAfter(1),areaAfter(2));
     nullDrive = nullDrive + addDistan;
     
     if iFlag == 1
         moneyDrive = moneyDrive + addDistan;
     end

     if iFlag == passinger(i)
         iChange = 0;
     else 
         iChange =1;
     end
     
     if iChange == 1
         if iFlag == 0
             moneyDrive = 0;
             moneyTime = [moneyTime;timeGet(i)];
             iFlag = 1;
         else
             wallet = MoneyOfTaxi(moneyDrive);
             earnMoney = [earnMoney;wallet];
             iFlag = 0;
         end
     end
     
     areaBefore = areaAfter;
     
 end
 
 xlsxload = [moneyTime,earnMoney];
 xlswrite('moneyof105.xlsx',xlsxload);
 
 
 
 
 
 
 
 
 
 
 
 