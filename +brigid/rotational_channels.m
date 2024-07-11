function [sig, rot] = get_rotational_channels()
  sig = [];
  rot = [];
  for strt = [0, 10]
    for shft = 1:9
      X = strt+(1:10);
      Y = circshift(X, -shft, 2);
      cs = g_c(X, Y);

      sig(end+(1:numel(cs))) = cs;
      rot(end+(1:numel(cs))) = cs([2:end, 1]);
    end
  end
  for shft = 1:3
    X = 21:24;
    Y = circshift(X, -shft, 2);
    cs = g_c(X, Y);

    sig(end+(1:numel(cs))) = cs;
    rot(end+(1:numel(cs))) = cs([2:end, 1]);
  end

  sig = sig(:);
  rot = rot(:);
end
