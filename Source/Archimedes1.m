function [ ] = Archimedes1(n) % n is the number of random points generated for the simulation

coordinate_matrix=zeros(3,n);    % a matrix to hold all the coordinates generated

cone_capacity=0;
sphere_capacity=0;
cylinder_capacity=0;

for i=1:n
    coordinate_matrix(1,i)=2*rand()-1; %x coordinate in a range [-1,1]
    coordinate_matrix(2,i)=2*rand()-1; %y coordinate in a range [-1,1]
    coordinate_matrix(3,i)=2*rand();   %z coordinate in a range [0,2]
    
    if sqrt((coordinate_matrix(1,i))^2+(coordinate_matrix(2,i))^2)<(1-0.5*coordinate_matrix(3,i))
        cone_capacity=cone_capacity+1;
        % counting the points which are inside the cone
    end
    if sqrt((coordinate_matrix(1,i))^2+(coordinate_matrix(2,i))^2+(coordinate_matrix(3,i)-1)^2)<1
        sphere_capacity=sphere_capacity+1;
        % counting the points which are inside the sphere
    end
    if sqrt((coordinate_matrix(1,i))^2+(coordinate_matrix(2,i))^2)<1
        cylinder_capacity=cylinder_capacity+1;
        % counting the points which are inside the cylinder
    end
end

cone_matrix=zeros(3,cone_capacity);
sphere_matrix=zeros(3,sphere_capacity);
cylinder_matrix=zeros(3,cylinder_capacity);
    
cone_index=1;
sphere_index=1;
cylinder_index=1;
    
for i=1:n
    if sqrt((coordinate_matrix(1,i))^2+(coordinate_matrix(2,i))^2)<(1-0.5*coordinate_matrix(3,i))
        cone_matrix(:,cone_index)=coordinate_matrix(:,i);
        cone_index=cone_index+1;
        % load the cone_matrix with the coordinates, which are inside the cone
    end
    if sqrt((coordinate_matrix(1,i))^2+(coordinate_matrix(2,i))^2+(coordinate_matrix(3,i)-1)^2)<1
        sphere_matrix(:,sphere_index)=coordinate_matrix(:,i);
        sphere_index=sphere_index+1;
        % load the sphere_matrix with the coordinates, which are inside the sphere
    end
    if sqrt((coordinate_matrix(1,i))^2+(coordinate_matrix(2,i))^2)<1
        cylinder_matrix(:,cylinder_index)=coordinate_matrix(:,i);
        cylinder_index=cylinder_index+1;
        % load the cylinder_matrix with the coordinates, which are inside the cylinder
    end
end

a=cylinder_capacity/cone_capacity;
b=sphere_capacity/cone_capacity;
c=cylinder_capacity/sphere_capacity;

fprintf('The proportion between the volumes of a cylinder and a cone (circumscribed by the cylinder) is: %d\n',a);
fprintf('The proportion between the volumes of a sphere and a cone (circumscribed by the sphere) is: %d\n',b);
fprintf('The proportion between the volumes of a cylinder and a sphere (circumscribed by the cylinder) is: %d\n',c);

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

    
