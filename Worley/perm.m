function val = perm(data, i)
    val = data.permTable(mod(i, data.tableSize) + 1);
end