function [f_] = smooth(varargin)
  function [fd, fa, chs] = f(fd, fa, chs)
    s_ = size(fd);
    for c = 1:prod(s_(2:end))
      fd(:, c) = smooth(fd(:, c), varargin{:});
    end
  end
  f_ = @f;
end
