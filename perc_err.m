function res = perc_err(p, x, c)
    res = sum((perc_recall(p, x) - c) .^ 2);

