function [locations] = tumour_location(phantoms, plugs)
  %% [locations] = tumour_location(phantoms, plugs)
  %     locations is 1 x 3 x numel(plugs) x numel(phantoms)
  locations = permute(brigid.hole_location(phantoms), [3, 2, 4, 5, 1]);
  radii = permute(brigid.tumour_sizes(plugs)/2, [3, 2, 4, 1]);
  radii(:, 1:2, :) = 0;

  locations = locations - radii;
end
