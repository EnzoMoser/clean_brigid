function [m] = tumour_mass(tumours)
  % Returns tumour mass in kg
  %   masses = tumour_mass(); 22x1 array
  %   masses = tumour_mass(tumours); Tx1 array of tumour masses
  m = [0.2 0.5 1.5 2.1 6.4 1.9 2.1 3.2 0.9 1.3 1.5 1.7 1.7 1.5 0.8 0.9 0.3 0.9 0.9 1.5 1.1 0.8]'*1e-3;
  if exist('tumours', 'var')
    if any(tumours < 0 | tumours > 22)
      not_exist = tumours(tumours < 0 | tumours > 22);
      error('brigid:tumour_masses', 'Tumour P%02d does not exist.', not_exist(1));
    end
    m = [0;m];
    m = m(tumours+1);
  end
end
