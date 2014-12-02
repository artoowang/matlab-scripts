function data = initData()
    data.tableSize = 10000;
    data.permTable = randperm(data.tableSize);
    
    for m=1:9
        prob = 1 / ((3^-m) * exp(3) * factorial(m));
        if (m == 1)
            data.probLow(m) = 0;
        else
            data.probLow(m) = data.probHigh(m-1);
        end
        
        data.probHigh(m) = data.probLow(m) + prob;
    end
    data.probHigh(9) = inf;
end