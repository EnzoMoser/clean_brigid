function [fd, fa, chs] = load_signals(phs, pls, varargin)
  if ~iscell(phs)
    phs = {phs};
  end

  %% Gather files
  files = cell(numel(phs), numel(pls), 2);
  for ph = 1:numel(phs)
    for pl = 1:numel(pls)
      files{ph, pl, 1} = brigid.get_data_file(phs{ph}, pls(pl), 'fat', true);
      files{ph, pl, 2} = brigid.get_data_file(phs{ph}, pls(pl));
    end
  end

  %% Load data
  fd = get_fd(files);
  fa = get_fa(files);
  chs = get_chs();

  %% Preprocess
  for v = 1:numel(varargin)
    [fd, fa, chs] = varargin{v}(fd, fa, chs);
  end
end

function [fd] = get_fd(files)
  D = cellfun(@(f) load(f, 'data'), files);
  fd = zeros([size(D(1).data), size(D)], 'like', 1j);
  fd(:, :, :) = cat(3, D.data);
end

function [fa] = get_fa(files)
  D_ = load(files{1}, 'frequency_axis');
  fa = D_.frequency_axis;
end

function [chs] = get_chs()
  [chs(:, 1), chs(:, 2)] = g_tx_rx(1:24^2);
end
