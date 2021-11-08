for long = 0:14
    short = fix((1200 - 85 * long) / 64);
    remain = 1200 - long * 85 - short * 64;
    fprintf('%2d根85cm, %2d根64cm, 余料%2dcm\n', long, short, remain);
end
