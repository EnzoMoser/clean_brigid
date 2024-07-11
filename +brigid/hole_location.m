function [varargout] = hole_location(phantoms, coords)
  % Return the hole location for one or more phantoms
  %   coords = hole_location(ph); returns array of coordinates 1x3
  %   coords = hole_location(phs); returns array of coordinates Px3
  %   [th, r, z] = hole_location(..., 'polar') returns angle, radius and z
  %   ph = 'B0' | 'B10U' | 'B10E' | 'B15U' | 'B15E' | 'B20E' | 'B30E'
  %   phs = {ph, ...}
  locs = struct(...
    'B0', {0, 15e-3, 40e-3} ...
    , 'B10U', {0, 35e-3, 45e-3} ...
    , 'B10E', {0, 30e-3, 35e-3} ...
    , 'B15U', {0, 35e-3, 35e-3} ...
    , 'B15E', {0, 30e-3, 35e-3} ...
    , 'B20E', {0, 28.3e-3, 42.5e-3} ...
    , 'B30E', {0, 25.5e-3, 35.7e-3} ...
    );

  if ~exist('coords', 'var')
    coords = 'cart';
  end
  if ~iscell(phantoms)
    phantoms = {phantoms};
  end
  if ~all(ismember(phantoms, fieldnames(locs)))
    phantoms_not_exist = phantoms(~ismember(phantoms, fieldnames(locs)));
    error('brigid:hole_location', 'Phantom %s does not exist.', phantoms_not_exist{1});
  end

  for p = 1:numel(phantoms)
    [t(p), r(p), z(p)] = locs.(phantoms{p});
  end

  switch coords
    case 'polar'
      varargout = {t, r, z};
    otherwise
      [x, y, z] = pol2cart(t, r, z);
      varargout{1} = [x(:), y(:), z(:)];
  end
end
