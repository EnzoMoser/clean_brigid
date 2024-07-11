function [tx, rx] = g_tx_rx(c)
    tx = ceil(c/24);
    rx = rem(c, 24);
    rx(rx == 0) = 24;
end

