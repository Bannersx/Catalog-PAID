clear;
clc;
close all;

pkg load image

% Cargar la imagen 
I_color = imread('Robin.jpg');
A       = I_color(:,:,1);

[m,n] = size(A);

%Para usar SVD, se necesita una imagen en formato doble para no perder
A = im2double(A);

[U,S,V] = svd(A);

%Muestra el comportamiento de los valores singulares
val_sing = diag(A);

plot(1:length(val_sing), val_sing)
title("Valores singulares de la imagen");

% Rango reducido

r = 100;

Ur = U(:,1:r);
Vr = V(:,1:r);
Sr = S(1:r,1:r);

% Una opcion es: Ar =  Ur * Sr* Vr';

% Aproximando la aproximacion del SVD
B = Ur *Sr;
C = Vr';

% Donde B y C aproximan la Imagen
Ar = B * C;
B1 = im2uint8(B);
C1 = im2uint8(C);
save('B.mat','B1');
save('C.mat', 'C1');

Ar = im2uint8(Ar);

figure
subplot(1,2,1)
title("original");
imshow(A);

subplot(1,2,2)
imshow(Ar);

error = norm(A-Ar,'fro')

