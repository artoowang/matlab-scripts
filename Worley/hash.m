function val = hash(data, ci)
    val = perm(data, ci(1) + perm(data, ci(2) + perm(data, ci(3))));
end