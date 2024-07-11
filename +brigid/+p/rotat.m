function [f_] = rotat()
  function [fd_, fa, chs] = f(fd, fa, chs)
    if size(fd, 2) ~= 24^2
      error('brigid:p:rotat', 'Requires all 576 channels for subtraction.');
    end
    [sig_chs, rot_chs] = brigid.rotational_channels();

    ratio = fd(:, sig_chs, :, :, 1)./fd(:, rot_chs, :, :, 1);
    fd_ = cat(5, ...
      fd(:, rot_chs, :, :, 2).*ratio, ...
      fd(:, sig_chs, :, :, 2));

    chs = chs(sig_chs, :);
  end
  f_ = @f;
end
