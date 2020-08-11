function [ ] = Prove_MC1(n) % n is the number of random points generated for the simulation

container_matrix=zeros(3,n);    % a matrix to hold all the coordinates generated

cone_capacity=0;
sphere_capacity=0;
cylinder_capacity=0;

for i=1:n
    container_matrix(1,i)=2*rand()-1; %x coordinate in a range [-1,1]
    container_matrix(2,i)=2*rand()-1; %y coordinate in a range [-1,1]
    container_matrix(3,i)=2*rand();   %z coordinate in a range [0,2]
    
    % So we generate random numbers inside a cube with an edge length of 2,
    % and the center of the cube is at coordinates (0,0,1), which will also
    % be the center of the generated sphere below
    
    if sqrt((container_matrix(1,i))^2+(container_matrix(2,i))^2)<(1-0.5*container_matrix(3,i))
        cone_capacity=cone_capacity+1;
        % counting the points which are inside the cone
    end
    if sqrt((container_matrix(1,i))^2+(container_matrix(2,i))^2+(container_matrix(3,i)-1)^2)<1
        sphere_capacity=sphere_capacity+1;
        % counting the points which are inside the sphere
    end
    if sqrt((container_matrix(1,i))^2+(container_matrix(2,i))^2)<1
        cylinder_capacity=cylinder_capacity+1;
        % counting the points which are inside the cylinder
    end
end

% The next 20-25 lines below are only necessary for the plotting.
cone_matrix=zeros(3,cone_capacity);
sphere_matrix=zeros(3,sphere_capacity);
cylinder_matrix=zeros(3,cylinder_capacity);
    
cone_index=1;
sphere_index=1;
cylinder_index=1;
    
for i=1:n
    if sqrt((container_matrix(1,i))^2+(container_matrix(2,i))^2)<(1-0.5*container_matrix(3,i))
        cone_matrix(:,cone_index)=container_matrix(:,i);
        cone_index=cone_index+1;
        % load the cone_matrix with the coordinates, which are inside the cone
    end
    if sqrt((container_matrix(1,i))^2+(container_matrix(2,i))^2+(container_matrix(3,i)-1)^2)<1
        sphere_matrix(:,sphere_index)=container_matrix(:,i);
        sphere_index=sphere_index+1;
        % load the sphere_matrix with the coordinates, which are inside the sphere
    end
    if sqrt((container_matrix(1,i))^2+(container_matrix(2,i))^2)<1
        cylinder_matrix(:,cylinder_index)=container_matrix(:,i);
        cylinder_index=cylinder_index+1;
        % load the cylinder_matrix with the coordinates, which are inside the cylinder
    end
end

% Theese 3 lines below are the essence of the demonstration, it should show
% that the voulme of a cylinder, and the volume of a sphere inside this
% cylinder and also the volume of a cone inside this cylinder compared to
% each other gives a relation of 3:2:1
% Of course the greater the number of points (n) generated, the greater the
% precision will be. For instance a generated number of 10e6 points
% provides a precision of 10e-3
a=cylinder_capacity/cone_capacity; % It should give a number close to 3
b=sphere_capacity/cone_capacity;   %  It should give a number close to 2
c=cylinder_capacity/sphere_capacity; % It should give a number close to 1.5

fprintf('The proportion between the volumes of a cylinder and a cone (circumscribed by the cylinder) is: %d\n',a);
fprintf('The proportion between the volumes of a sphere and a cone (circumscribed by the sphere) is: %d\n',b);
fprintf('The proportion between the volumes of a cylinder and a sphere (circumscribed by the cylinder) is: %d\n',c);

% Plotting the matrices, which are holding the cordinates of the cone,
% spehre and cylinder
subplot(1,3,1)
plot3(cone_matrix(1,:),cone_matrix(2,:),cone_matrix(3,:),'.');
title('Cone')
subplot(1,3,2)
plot3(sphere_matrix(1,:),sphere_matrix(2,:),sphere_matrix(3,:),'.');
title('Sphere')
subplot(1,3,3)
plot3(cylinder_matrix(1,:),cylinder_matrix(2,:),cylinder_matrix(3,:),'.');
title('Cylinder') 

end

    
