function [f_] = do_subtraction()
  function [fd, fa, chs] = f(fd, fa, chs)
    fd = diff(fd, 1, 5);
  end
  f_ = @f;
end
