function [c] = g_c(tx, rx, expand)
  if ~exist('rx', 'var')
    rx = tx;
  end
  conv_ = @(t, r) (t-1)*24+r;

  tx = tx(:);
  rx = rx(:);
  c = zeros(numel(tx)*numel(rx), 1);
  if exist('expand', 'var')
    for t = 1:numel(tx)
      c((1:numel(rx))+(t-1)*numel(rx)) = conv_(tx(t), rx);
    end
  else
    c = conv_(tx, rx);
  end
end
