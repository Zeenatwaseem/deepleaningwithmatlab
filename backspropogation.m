clc;
y=[];
in = [0 0;0 1;1 0;1 1];
t = [0 1 1 1];
% back propogate for or
cof=0.25;
w11 = 0.6;
w21 = -0.1;
b1 = 0.3;
w12 = -0.3;
w22 =0.4;
b2 =0.5;
v1 = 0.4;
v2 = 0.1;
b3 = -0.2;
out=[0;0;0;0];
er=[];
mse=[];
z1=[];
z2=[];
del=[];
del1=[];
del2=[];
W11 = [];
W12 = [];
W21 = [];
W22 = [];
delta1=[];
delta2=[];
dw1=[];
dw2=[];
db1=[];
db2=[];
lr=0.25;
n=input("no of iterations");

for i=1:n
     fprintf('------------------------------------------------------------------------------Epoch------------------------------------------------------------------------------------------------------------------------');
    for j=1:4
       
        h1=b1+in(j,1)*w11+in(j,2)*w21;

         z1(j) = Sigmoid(h1);

        h2=b2+in(j,1)*w11+in(j,2)*w21;

        z2(j) = Sigmoid(h2);

        out = z1(j).*v1 + z2(j).*v2 + b3;
        y(j)= Sigmoid(out);

        e=t(j)-y(j);
        er(j)=e*e;
        del(j) = e* SigmoidDerivative(out);
        del1(j)=del(j)*v1;
        del2(j)=del(j)*v2;
        delta1(j) = del1(j)*SigmoidDerivative(z1(j));
        delta2(j) = del2(j)*SigmoidDerivative(z2(j));
        dw11(j) = lr.*delta1(j).*in(j,1);
        dw21(j) = lr.*delta1(j).*in(j,2);
        db1(j) = lr.*delta1(j);

        dw12(j) = lr.*delta2(j).*in(j,1);
        dw22(j) = lr.*delta2(j).*in(j,2);

        db2(j) = lr.*delta1(j);
        dv1(j) = lr.*del(j).*z1(j);
        dv2(j) = lr.*del(j).*z2(j);
        db3(j) = lr.*del(j);
       
        w11 = w11 + dw11(j);
        b1 = b1 + db1(j);
        
        w21 = w21 + dw21(j);
        w12 = w12 + dw12(j);
        w22 = w22 + dw22(j);
        b2 = b2 + db2(j);
        v1 = v1 + dv1(j);
        v2 = v2 + dv2(j);
        b3 = b3 + db3(j);
        
        

         


    end


m=mean(er);
mse(i)=m;
p = table(w11,w12,w21,w22)
p = table(z1,z2,y,er,del,delta1,delta2)          
end
disp("mean square error are")
disp(mse)
x=[0:1:length(mse)-1];
y=mse;
plot(x,y,'-*','LineWidth',2.0);
title("Mean-Sq-Error Graph ")
function[output]=Sigmoid(input)
output=1./(1+exp(-input));
end

function[output]=SigmoidDerivative(input)
output=(input*(1-(input)));
end

