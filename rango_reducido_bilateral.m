function [B,C] =rango_reducido_bilateral(A,r,p)
  % Primer paso
  % A es una matriz de mxn, extraemos el segundo valor
  n = size(A,2);
  
  Y2 = randn(n,r);
  
  % Segundo Paso
  for k = 1:p
    Y1 = A * Y2;
    Y2 = A' * Y1;
  endfor
  
  % Tercer Paso
  [Q,~] = qr(Y2); % Y2 = QR, Q es ortogonal y R es triangular superior
  
  % Paso 4
  Qr = Q(:,1:r);
    
  % Quinto Paso;
  
  B = A * Qr;
  C = Qr';
  
 endfunction