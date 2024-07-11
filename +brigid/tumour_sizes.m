function [sizes] = tumour_sizes(tumours)
  % Returns tumour sizes in metres
  %   sizes = tumour_sizes(); 22x3 array
  %   sizes = tumour_sizes(tumours); Tx3 array of tumour sizes
  sizes = [5.22,6.96,3.69;
    8.36,8.83,6.18;
    10.86,10.95,10.84;
    13.66,13.78,11.95;
    20.36,20.70,19.44;
    11.28,20.48,8.2;
    21.7,13.1,9.11;
    11.87,12.35,20.85;
    11.73,15.04,11.73;
    15.16,16.63,9.66;
    13.17,22.05,17.54;
    18.83,14.07,13.63;
    14.38,26.96,8.8;
    16.58,10.54,22.38;
    14.11,17.18,15.51;
    20.53,19.53,14.09;
    15.79,18.97,3.73;
    23.17,17.16,13.36;
    23.26,8.73,23.47;
    21.32,24.51,21;
    25.79,12.52,33;
    21.02,22.80,34.44]*1e-3;
  if exist('tumours', 'var')
    if any(tumours < 0 | tumours > 22)
      not_exist = tumours(tumours < 0 | tumours > 22);
      error('brigid:tumour_sizes', 'Tumour P%02d does not exist.', not_exist(1));
    end
    sizes = [0,0,0;sizes];
    sizes = sizes(tumours+1, :);
  end
end
