function [f_] = changeClass(toClass)
  function [fd, fa, chs] = f(fd, fa, chs)
    fd = toClass(fd);
  end
  f_ = @f;
end
