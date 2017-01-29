%% Read Image
imagen=imread('Test_1.jpg');
%% Show image
figure(1)
imshow(imagen);
title('INPUT IMAGE WITH NOISE')
%% Convert to gray scale
if size(imagen,3)==3 % RGB image
  imagen=rgb2gray(imagen);
%   figure(7)
%   imshow(imagen);
end
%% Convert to binary image
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
figure(5)
imshow(~imagen);
% Remove all object containing fewer than 50 pixels
imagen = bwareaopen(imagen,50);
figure(4)
imshow(imagen);
pause(1)
%% Show image binary image
figure(2)
imshow(imagen);
title('INPUT IMAGE WITHOUT NOISE')
%% Label connected components
[L Ne]=bwlabel(imagen);
%% Measure properties of image regions
propied=regionprops(L,'BoundingBox');
figure(6)
imshow(imagen);
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
  rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
pause (1)
%% Objects extraction

for n=1:Ne
    figure(10+n)
  [r,c] = find(L==n);
  n1=imagen(min(r):max(r),min(c):max(c));
  imshow(~n1);
  pause(0.5)
end