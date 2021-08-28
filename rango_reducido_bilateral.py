import numpy as np
import cv2 as cv
from numpy.core.fromnumeric import transpose
def rango_reducido_bilateral(A, r, p):
    
    #First step
    width = A.shape[:2][1]
    print(width)
    Y2 = np.random.normal(width,r)
    
    #Second step
    for k in range(p):
        Y1 = np.dot(A, Y2)
        Y2 = np.dot(A.T, Y1)
    #Third step
    
    Q = np.linalg.qr(Y2)[0]
    
    

    Qr = Q[:, 0:r]
    print(' Esto es Qr\n')
    print(Qr)
    B = np.dot(A, Qr)
    C = Qr.T

    return (B,C)



def main():
    img = cv.imread("/home/banners/Documents/TEC/IIS 2021/PAID/Catalog-PAID/ts.jpg",0)
    B,C = rango_reducido_bilateral(img, 200, 10)
    print('\n Esto es B')
    print(B)

    Ri = np.dot(B,C)
    python = cv.bilateralFilter(img,15,75,75)
    cv.imshow('Original Image',img)
    cv.waitKey(0)

    cv.imshow('Reconstructed Image',Ri)
    cv.waitKey(0)

    cv.imshow('With openCV Image',python)
    cv.waitKey(0)
if __name__ == "__main__":
    main()
