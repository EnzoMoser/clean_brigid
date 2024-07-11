function [all_correct] = test_rotational_channels()
  [sig(:, 1), sig(:, 2)] = brigid.rotational_channels();

  sig_ = zeros(size(sig, 1), 2, size(sig, 2));
  [sig_t, sig_r, sig_z] = deal(zeros(size(sig_)));
  for s = 1:size(sig, 2)
    [sig_(:, 1, s), sig_(:, 2, s)] = g_tx_rx(sig(:, s));

  end

  for s = 1:size(sig_, 2)*size(sig_, 3)
    [sig_t(:, s), sig_r(:, s), sig_z(:, s)] = brigid.antenna_locations(sig_(:, s), 'polar');
  end

  eq_tol = @(a, b) abs(a - b) < 1e-6;
  eq_ang = @(a, b, d) eq_tol(abs(angdiff(a, b)), deg2rad(d));
  eq_rot = @(a, b) eq_ang(a, b, 36) | eq_ang(a, b, 90);

  same_z_plane = compare(eq_tol, sig_z)
  same_radius = compare(eq_tol, sig_r)
  same_angle = compare(eq_rot, sig_t)

  all_correct = same_z_plane & same_radius & same_angle;

  function [correct] = compare(fn, a)
    same = fn(a(:, :, 1), a(:, :, 2));
    correct = all(same(:));

    if ~correct
      fprintf('%d/%d incorrect:\n', sum(~same(:)), numel(same(:)));
      [c, ~] = ind2sub([size(a, 1), size(a, 2)], find(~same));
      sig_(c, :, 1)
      sig_(c, :, 2)

      rad2deg(abs(angdiff(a(c, 1, 1), a(c, 1, 2))))
    end
  end
end
