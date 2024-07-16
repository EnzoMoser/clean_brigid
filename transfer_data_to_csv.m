function transfer_data_to_csv(output_dir)
% Will take all the .mat phantom data files from BRIGID and convert them...
% ...into csv in the output directory "output_dir".
% If the directory "output_dir" does not exist, it will create it.
%
% Example use:
%   "transfer_data_to_csv('../declan_MERIT/example_data')"
%    - this will go up a directory, go inside declan_MERIT, create...
%    ... example_data (if it does not exist), and places the .csv files...
%    ... inside example_data.
%
% YOU MUST HAVE the "data" folder from BRIGID in your path to run this.

    function a = create_path(file_name, file_path)
        a = fullfile(file_path, [file_name, '.csv']);
    end

    if ~exist(output_dir, 'dir')
        mkdir(output_dir);
    end

    B_range = {'B0', 'B10E', 'B15E', 'B20E', 'B30E'};
    P_range = 0:22;

    %B_range = {'B0'}; P_range = 3; % Save only one .mat file to CSV.
    
    [csv_all, freq, chan] = brigid.rotat_raw_sigs( B_range, P_range  );

    dlmwrite(create_path('frequencies', output_dir), freq, 'delimiter', '\n') %#ok<DLMWT>
    dlmwrite(create_path('channel_names', output_dir), chan) %#ok<DLMWT>
    dlmwrite(create_path('antenna_locations', output_dir), brigid.antenna_locations(), 'precision','%.3f' ) %#ok<DLMWT>

    len_B = length(B_range);
    len_P = length(P_range);

    % Loop through each value in B_range
    for B_it = 1:len_B
        % Loop through each value in P_range
        for P_it = 1:len_P
            str000 = sprintf('%s_P%d_p000', B_range{B_it}, P_range(P_it) );
            str036 = sprintf('%s_P%d_p036', B_range{B_it}, P_range(P_it) );
            if len_B > 1
                if len_P > 1
                    dlmwrite(create_path(str000, output_dir), csv_all(:, :, B_it, P_it, 1) ) %#ok<DLMWT>
                    dlmwrite(create_path(str036, output_dir), csv_all(:, :, B_it, P_it, 2) ) %#ok<DLMWT>
                else
                    dlmwrite(create_path(str000, output_dir), csv_all(:, :, B_it, 1) ) %#ok<DLMWT>
                    dlmwrite(create_path(str036, output_dir), csv_all(:, :, B_it, 2) ) %#ok<DLMWT>
                end
            else
                if len_P > 1
                    dlmwrite(create_path(str000, output_dir), csv_all(:, :, P_it, 1) ) %#ok<DLMWT>
                    dlmwrite(create_path(str036, output_dir), csv_all(:, :, P_it, 2) ) %#ok<DLMWT>
                else
                    dlmwrite(create_path(str000, output_dir), csv_all(:, :, 1) ) %#ok<DLMWT>
                    dlmwrite(create_path(str036, output_dir), csv_all(:, :, 2) ) %#ok<DLMWT>
                end
            end
        end
    end

end

