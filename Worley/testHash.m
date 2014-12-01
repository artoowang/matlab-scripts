function hashVals = testHash
    data = initData();
    hashVals = zeros(11, 11, 11);
    for x = -5:5
        for y = -5:5
            for z = -5:5
                ci = [x y z];
                hashVals(x+6, y+6, z+6) = hash(data, ci);
            end
        end
    end
end