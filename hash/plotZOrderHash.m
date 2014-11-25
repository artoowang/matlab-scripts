function hash = plotZOrderHash
    x = 0:255;
    y = 0:255;
    [xx, yy] = meshgrid(x, y);
    hash = zOrderHash(xx(:), yy(:), 0);
    hist(hash);
end