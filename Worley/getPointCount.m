function m = getPointCount(data)
    prob = rand();
    low = 1;
    high = 9;
    m = 0;
    while (low <= high)
        m = floor((low + high) / 2);
        
        if (prob < data.probLow(m))
            high = m - 1;
        elseif (prob >= data.probHigh(m))
            low = m + 1;
        else
            break;
        end
    end
end