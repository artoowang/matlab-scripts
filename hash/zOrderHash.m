function [hash, perm] = zOrderHash(ix, iy, iz, perm)
    order = [20 19 18 18 17 16 16 15 14 14 13 12 12 11 10 10 9 8 8 7 6 6 5 4 4 3 2 2 1 0];
    if (~exist('perm', 'var'))
        perm = randperm(length(order));
    end
    hash = 0;
    hash = bitor(bitshift(bitand(ix, 512), order(perm(1))), hash);
    hash = bitor(bitshift(bitand(iy, 512), order(perm(2))), hash);
    hash = bitor(bitshift(bitand(iz, 512), order(perm(3))), hash);
    hash = bitor(bitshift(bitand(ix, 256), order(perm(4))), hash);
    hash = bitor(bitshift(bitand(iy, 256), order(perm(5))), hash);
    hash = bitor(bitshift(bitand(iz, 256), order(perm(6))), hash);
    hash = bitor(bitshift(bitand(ix, 128), order(perm(7))), hash);
    hash = bitor(bitshift(bitand(iy, 128), order(perm(8))), hash);
    hash = bitor(bitshift(bitand(iz, 128), order(perm(9))), hash);
    hash = bitor(bitshift(bitand(ix, 64), order(perm(10))), hash);
    hash = bitor(bitshift(bitand(iy, 64), order(perm(11))), hash);
    hash = bitor(bitshift(bitand(iz, 64), order(perm(12))), hash);
    hash = bitor(bitshift(bitand(ix, 32), order(perm(13))), hash);
    hash = bitor(bitshift(bitand(iy, 32), order(perm(14))), hash);
    hash = bitor(bitshift(bitand(iz, 32), order(perm(15))), hash);
    hash = bitor(bitshift(bitand(ix, 16), order(perm(16))), hash);
    hash = bitor(bitshift(bitand(iy, 16), order(perm(17))), hash);
    hash = bitor(bitshift(bitand(iz, 16), order(perm(18))), hash);
    hash = bitor(bitshift(bitand(ix, 8), order(perm(19))), hash);
    hash = bitor(bitshift(bitand(iy, 8), order(perm(20))), hash);
    hash = bitor(bitshift(bitand(iz, 8), order(perm(21))), hash);
    hash = bitor(bitshift(bitand(ix, 4), order(perm(22))), hash);
    hash = bitor(bitshift(bitand(iy, 4), order(perm(23))), hash);
    hash = bitor(bitshift(bitand(iz, 4), order(perm(24))), hash);
    hash = bitor(bitshift(bitand(ix, 2), order(perm(25))), hash);
    hash = bitor(bitshift(bitand(iy, 2), order(perm(26))), hash);
    hash = bitor(bitshift(bitand(iz, 2), order(perm(27))), hash);
    hash = bitor(bitshift(bitand(ix, 1), order(perm(28))), hash);
    hash = bitor(bitshift(bitand(iy, 1), order(perm(29))), hash);
    hash = bitor(bitshift(bitand(iz, 1), order(perm(30))), hash);
end