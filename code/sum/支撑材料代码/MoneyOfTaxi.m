function [money] = MoneyOfTaxi(m)
%输入里程数,时间，计算价格
    if m < 3
        money = 14;
    elseif m < 15
        money = 14 + ( m - 3 ) * 2.5;
    else
        money = 14 + ( 15 - 3 ) * 2.5 +( m - 15 ) * 3.6;
    end
end

