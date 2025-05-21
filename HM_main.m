% Main MATLAB script
format long;


% LV-1
% Display Shapefiles and save classes separately
displayShapeFiles();

% LV-2
% Calculate World File
basename = 'example'; % You need to replace this with your actual basename
points = [ /* Your points data here */ ];
calcWorldFile(basename, points);

% LV-3
% Transformation to geographic coordinates and saving to shapefile
geoTif = 'path_to_geotiff.tif'; % Replace with your GeoTIFF file path
shapeFile = 'path_to_shapefile.shp'; % Replace with your Shapefile path
HM_init_ShapeFile(geoTif, shapeFile);
