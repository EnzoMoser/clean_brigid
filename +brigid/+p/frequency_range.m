function [f_] = frequency_range(low, high)
  function [fd, fa, chs] = f(fd, fa, chs)
    F = fa >= low & fa <= high;
    fa = fa(F);
    fd = fd(F, :, :, :, :);
  end
  f_ = @f;
end
