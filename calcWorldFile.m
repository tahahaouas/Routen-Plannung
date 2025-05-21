function calcWorldFile(basename, points)
    % Calculation of World File
    % A * x = b  ==> x_lat = [a11, a12, tx] ; x_lon = [a21, a22, ty];
    A = zeros(length(points), 3);
    b_lat = zeros(length(points), 1);
    b_lon = zeros(length(points), 1);

    for i = 1:length(points)
        A(i, :) = [points(i, 3), points(i, 4), 1];
        b_lat(i) = points(i, 1);
        b_lon(i) = points(i, 2);
    end

    % Solve for latitude and longitude coefficients
    x_lat = A \ b_lat; % Using matrix left division for solving
    x_lon = A \ b_lon; % Using matrix left division for solving

    % Write to .jgw file
    fnWorld = sprintf('%s.jgw', basename);
    fileID = fopen(fnWorld, 'w');

    fprintf(fileID, '%2.12f\n', x_lat(1));
    fprintf(fileID, '%2.12f\n', x_lat(2));
    fprintf(fileID, '%2.12f\n', 0); % Assuming rotation terms are 0
    fprintf(fileID, '%2.12f\n', 0); % Assuming rotation terms are 0
    fprintf(fileID, '%2.12f\n', x_lon(1));
    fprintf(fileID, '%2.12f\n', x_lon(3));

    fclose(fileID);
end
