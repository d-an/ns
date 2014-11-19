function c = perc_recall(p, x)
    extended = [x; ones(1, size(x, 2))];
    c = p * extended >= 0;
end

