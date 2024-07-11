function [varargout] = antenna_locations(ants, coords)
  if ~exist('coords', 'var')
    coords = 'cart';
  end

  elevations = [9, 32, 55];
  offsets = [0, 18, 12];

  r = 7e-2;

  elevations_ = [repmat(elevations(1), [1, 10]), repmat(elevations(2), [1, 10]), repmat(elevations(3), [1,4])];
  thetas = [(0:9)*36, (0:9)*36+18, (0:3)*90+12];
  radii = cosd(elevations_)*r;
  zs = sind(elevations_)*r;
  
  [xs, ys, zs] = pol2cart(deg2rad(thetas), radii, zs);
  points_3d = [xs(:), ys(:), zs(:)];
  if exist('ants', 'var')
    points_3d = points_3d(ants, :);
  end

  switch coords
    case 'polar'
      [varargout{1:3}] = cart2pol(points_3d(:, 1), points_3d(:, 2), points_3d(:, 3));
    otherwise
      varargout{1} = points_3d;
  end
end
