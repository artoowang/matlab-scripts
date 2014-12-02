function pts = generatePoints()
    data = initData();
    pts = [];
    for x = -5:5
        for y = -5:5
            for z = -5:5
                nCubePt = getPointCount(data);
                for i = 1:nCubePt
                    pt = [x + rand(); y+rand(); z+rand()];
                    pts = [pts pt];
                end
            end
        end
    end
end