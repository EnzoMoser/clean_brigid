function [f_] = fold_reciprocal(fn)
  function [fd_, fa, chs] = f(fd, fa, chs)
    recip = false(size(chs, 1), 1);

    for c = 1:size(chs, 1)
      found = find(chs(:, 2) == chs(c, 1) & chs(:, 1) == chs(c, 2) & chs(c, 1) ~= chs(c, 2));
      if found
        recip(c) = true;
        fd_(:, found, :, :, :) = fn(fd(:, [c, found], :, :, :), 2);
      end
    end

    dups = chs(:, 1) > chs(:, 2) & recip;
    fd_(:, dups, :, :, :) = [];
    chs(dups, :) = [];
  end
  f_ = @f;
end
