function [f_] = multi()
  function [fd, fa, chs] = f(fd, fa, chs)
    mono = find(chs(:, 1) == chs(:, 2));
    chs(mono, :) = [];
    fd(:, mono, :, :, :) = [];
  end
  f_ = @f;
end
