function [f] = get_data_file(ph, pl, varargin)
  p = inputParser();
  p.addParameter('fat', false);
  p.addParameter('orientation', 0);
  p.addParameter('iteration', 2);
  p.parse(varargin{:});
  fat = p.Results.fat;
  orientation = p.Results.orientation;
  iteration = p.Results.iteration;

  if fat
    prefix = 'F1b';
  else
    prefix = '';
  end
  f = sprintf('%s_%sP%d_p%d_%d.mat', ph, prefix, pl, orientation, iteration);
  if ismember(ph, {'B0', 'B10U', 'B10E', 'B15U'}) ...
      || (strcmp('B15E', ph) && pl < 8)
    f = fullfile('data', 'DOL-170327A', f);
  else
    f = fullfile('data', 'DOL-170404A', f);
  end
end
