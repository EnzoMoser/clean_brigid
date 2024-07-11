function [f_] = rotat_chs()
  function [fd_, fa, chs] = f(fd, fa, chs)
    if size(fd, 2) ~= 24^2
      error('brigid:p:rotat', 'Requires all 576 channels for subtraction.');
    end
    sig_chs = brigid.rotational_channels();
    fd_ = fd(:, sig_chs, :, :, 2);
    chs = chs(sig_chs, :);
  end
  f_ = @f;
end
