function [ ] = Archimedes2(n, delta)
% n is the number of points you want to generate, delta is a parameter
% which indicates how close should be a point to the surface to
% be acknowledged as a "surface point"

coordinate_matrix=zeros(3,n);

cube_surface=0;
sphere_surface=0;

for i=1:n
    coordinate_matrix(1,i)=2*(1+delta)*rand()-(1+delta);
    coordinate_matrix(2,i)=2*(1+delta)*rand()-(1+delta);
    coordinate_matrix(3,i)=2*(1+delta)*rand()-(1+delta);
    
    if abs(coordinate_matrix(1,i))>=1-delta || abs(coordinate_matrix(2,i))>=1-delta || abs(coordinate_matrix(3,i))>=1-delta
        cube_surface=cube_surface+1;
        % counting cube "surface"
    end
    if sqrt((coordinate_matrix(1,i))^2+(coordinate_matrix(2,i))^2+(coordinate_matrix(3,i))^2)>=1-delta && sqrt((coordinate_matrix(1,i))^2+(coordinate_matrix(2,i))^2+(coordinate_matrix(3,i))^2)<=1+delta
        sphere_surface=sphere_surface+1;
        % counting sphere "surface"
    end
        
end

cube_matrix=zeros(3,cube_surface);
sphere_matrix=zeros(3,sphere_surface);

cube_index=1;
sphere_index=1;

for i=1:n
    if abs(coordinate_matrix(1,i))>=1-delta || abs(coordinate_matrix(2,i))>=1-delta || abs(coordinate_matrix(3,i))>=1-delta
        cube_matrix(:,cube_index)=coordinate_matrix(:,i);
        cube_index=cube_index+1;
    end
    if sqrt((coordinate_matrix(1,i))^2+(coordinate_matrix(2,i))^2+(coordinate_matrix(3,i))^2)>=1-delta && sqrt((coordinate_matrix(1,i))^2+(coordinate_matrix(2,i))^2+(coordinate_matrix(3,i))^2)<=1+delta
        sphere_matrix(:,sphere_index)=coordinate_matrix(:,i);
        sphere_index=sphere_index+1;
    end
end

% We know the surface of a cube, and we use this to define the surface of a
% sphere.
q=cube_surface/sphere_surface;
fprintf('The surface of cube divided by the surface of sphere is: %d\n',q);

subplot(1,2,1);
plot3(cube_matrix(1,:),cube_matrix(2,:),cube_matrix(3,:),'.');
title('Cube surface');
subplot(1,2,2);
plot3(sphere_matrix(1,:),sphere_matrix(2,:),sphere_matrix(3,:),'.');
title('Sphere surface');

% So, to this point it proves, that the surface of a cube with an
% edgelenght of 2 is equal with the surface of a sphere with a radius of 1
% multiplied by 1.91 plus/minus some error (which depends on the simulation
% parameters). Thesurface of the cube above is 24 exactly, which means, the
% surface of the sphere is 12.56 plus/minus some error. If we divide this 
% result with pi, it is almost exactly 4, which means, that the surface of 
% a sphere with a radius of 1 is 4*pi, which is a well known fact, we just 
% proved it with a MC simulation. This is also equal with the lateral 
% surface area of a cylinder with a radius of 1, and with a height of 2.
% With further discussion below I want to prove an another theorem of 
% Archimedes, which says that if we cut out paralell sections with equal 
% width from this sphere and the lateral area of the cylinder above(so 
% basically we making rings from the cylinder, and spherical zones from the
% sphere, which has the same width), these parts will also will have the
% same area.

interval=1; % It is enough to inspect one half of the sphere, so in a range [0,1]

% Theese 3 matrices below will be only examples to show the theorem is
% right, the numbers of 5, 6 and 7 means 3 separate simlations, where we 
% divide the [0,1] interval by theese numbers so we get 5, 6 and 7 peaces  
% of sections with equal width from the half spehre in each simulation, 
% which sections -if the theorem is right- will have the same area.
matrix_5=zeros(1,5);
matrix_6=zeros(1,6);
matrix_7=zeros(1,7);

section_area=0;

for i=5:7
    width=interval/i;
    for j=1:i
        for k=1:sphere_surface
            if sphere_matrix(1,k)>=(j-1)*width && sphere_matrix(1,k)<j*width
                section_area=section_area+1;
            end
        end    
        if i==5
            matrix_5(1,j)=section_area;
        end
        if i==6
            matrix_6(1,j)=section_area;
        end
        if i==7
            matrix_7(1,j)=section_area;
        end
        section_area=0;
    end
end

% By displaying theese matrices, we will see 3 rows of numbers, 5 numbers
% in the first row, 6 in the second and 7 in the third, which are
% representing the 3 matrices above. The numbers shown in each line should
% be close to equal, with some error of course. The greater the random
% numbers generated, te greater the precision will be. For instance a
% simulation with n=10e6 and delta=0.01 will give a relative error around
% 1-2 percent in each row.
disp(matrix_5);
disp(matrix_6);
disp(matrix_7);

end