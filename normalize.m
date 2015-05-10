function n = normalize(x)
minimum = min(x);
maximum = max(x);
n = (x-min(x))/(max(x)-min(x));