%% 1. Import the States
%************************%
innerLoops = 4;

theStates = fopen( 'total_states.txt', 'r' );
tStates = textscan(theStates,'%f %f %f %f %f %f %f %f %f %f %f %f');
fclose(theStates);
totalStates = [tStates{1}, tStates{2}, tStates{3}, tStates{4}, tStates{5}, tStates{6}, tStates{7}, ...
tStates{8}, tStates{9}, tStates{10}, tStates{11}, tStates{12}];


%% 2. Import the Euler Angles
%******************************************%
euler = fopen( 'euler.txt', 'r' );
theEuler = textscan(euler,'%f %f %f');
fclose(euler);
eulerpsi = theEuler{1};
eulertheta = theEuler{2};
eulerphi = theEuler{3};


%% 3. Import the Reference Path (desired path to follow)
%*******************************************************%
reference = fopen( 'trajectory_reference.txt', 'r' );
theReference = textscan(reference,'%f %f %f');
fclose(reference);

x_ref = theReference{1};
y_ref = theReference{2};
z_ref = theReference{3};


path = fopen( 'flight_path.txt', 'r' );
thePath = textscan(path,'%f %f %f');
fclose(path);

xplot = thePath{1};
yplot =  thePath{2};
zplot = thePath{3};


%% 4. Draw the VTOL :)
%***********************%
%ax1 = axes('XLim',[30 60],'YLim',[-25 25],'ZLim',[-60 60],'Box','on');
ax1 = axes('Box','on','View',[20 60],'LineWidth',0.6,'FontSize',8);

hold on;
%grid on;
view(3);

xlabel('latitude')
ylabel('longitude')
zlabel('altitude')

h = vtolModel();

% 4.1 Create group object and parent surfaces
combined_objects = hgtransform('Parent',ax1);
set(h,'Parent',combined_objects)

% 4.2 Set the renderer to OpenGL and update the display
set(gcf, 'renderer','opengl')
%drawnow

set(gca,'fontname','times')
plot3(x_ref,y_ref,z_ref,'--b','LineWidth',2)
plot3(xplot,yplot,zplot,'r','LineWidth',1)

trans = makehgtformoctave('translate',[xplot(1) yplot(1) zplot(1)]);
set(combined_objects, 'Matrix', trans);

legend({'Reference path','UAV trajectory', ''},'Location','northeast','FontSize',12,'fontname','times')


%% 5. Import the 3d map and draw it
%***********************************%
ETOPO1 = load('the_3d_map.txt');
ETOPO1 = flipud(ETOPO1);
ETOPO1(ETOPO1 == -32768) = NaN;
[LON,LAT] = meshgrid(30:1/60:60,-20:1/60:20);

surf(LON,LAT,ETOPO1/100,'SpecularExponent',20,'FaceLighting','phong','FaceColor','interp','EdgeColor','none','HandleVisibility','off')
light('Style','local', 'Position',[145 70 155801]);
colormap(jet)


%% 6. Begin the animation
%**************************%
%pause();
for i = 1: length(totalStates(1:innerLoops:end,8))-1
	trans = makehgtformoctave('translate',[xplot(i) yplot(i) zplot(i)]);
    rotz = makehgtformoctave('zrotate',real(eulerpsi(i)));
    roty = makehgtformoctave('zrotate',real(eulertheta(i)));
    rotx = makehgtformoctave('zrotate',real(eulerphi(i)));
	set(combined_objects, 'Matrix', trans*rotx*roty*rotz);
    if i < 30
        pause(0.05); %0.3
    else
        pause(0.01);
    end
end
