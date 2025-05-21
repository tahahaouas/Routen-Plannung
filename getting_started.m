    figure(9);
    roads = shaperead('boston_roads.shp');
    roadsColors = makesymbolspec('Line', ...
    {'CLASS', 2, 'Color', 'y'}, ...
    {'CLASS', 3, 'Color', 'm'}, ...
    {'CLASS', 4, 'Color', 'blue'}, ...
    {'CLASS', 5, 'Color', 'green'}, ...
    {'CLASS', 6, 'Color', 'r'}, ...
    {'Default', 'Color', 'black'});

    mapshow(roads, 'SymbolSpec', roadsColors);
    title('Boston roads in NAD83 projected coordinates [meter]');

    for i = 1:6
        roads_Sel = shaperead('boston_roads.shp', 'Selector', ...
                    {@(v1, v2) (v1 == i) && (v2 >= 0), 'CLASS', 'LENGTH'});
        fn = sprintf('roads%d.mat', i);
        save(fn, 'roads_Sel');
    end

    figure(2);
    title('Boston roads in geographic coordinates');

info = geotiffinfo( 'boston.tif' );
roads = shaperead( 'boston_roads.shp'); %

N=1;

for i = 1 : length(roads)
for k = 1 : length( roads(i).X  ) % gleiche Länge wie length( roads(i).Y  )

% skal. von m nach sf
X(N) = roads(i).X(k) * unitsratio( 'sf', 'm' );
Y(N) = roads(i).Y(k) * unitsratio( 'sf', 'm' );

N = N+1;

end
end
% Transf. von proj. NAD83 [sf] in lon/lat 
[lat, lon] = projinv( info, x, y ); 
mapshow( lon, lat, 'Color', 'green' );
geoshow( lat, lon, 'Color', 'green' );



