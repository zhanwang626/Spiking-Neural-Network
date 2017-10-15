function val = k(t)
    V0=2.1165;
    tao = 10;
    taos = tao/4;
    val = V0*(exp(-t/tao)-exp(-t/taos));
end