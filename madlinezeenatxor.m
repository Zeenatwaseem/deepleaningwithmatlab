clc;
clear;
%and madaline
%Input and Target
x1=[1 1 -1 -1];
x2=[1 -1 1 -1];
t=[-1 1 1 -1];
%Assume initial weight matrix and bias
w11=0.05; 
w12=0.2; 
w21=0.05; 
w22=0.2; 
b1=0.3; 
b2=0.15; 
b3=0.5; 
v1=0.5; 
v2=0.5; 
alpha=0.5; 
e=0;
yin=[];
er=[];
r=[];
for p=1:2
    disp('----------------------epoch is---------------------------')
    disp(p)
    for i=1:4
      
              zin1=b1+x1(i)*w11+x2(i)*w21;
              zin2=b2+x2(i)*w12+x2(i)*w22;
              z=[zin1 zin2]
                if (zin1>=0)
                  z1=1;
                 else
                 z1=-1;
                end
                 if (zin2>=0)
                  z2=1;
                 else
                 z2=-1;
                 end
                hid=[z1 z2]
                yin(i)=b3+z1*v1+z2*v2;
                if (yin(i)>=0)
                   y=1;
               else
                  y=-1;
                end
                disp(yin(i))
               
               e=(t(i)-yin(i));
               er(i)=e*e;
              
               

             if(y~=t(i))
               if (t(i)==1) 
                   if(zin1<zin2)
                
                     b1=b1+alpha*(1-zin1);
                     w11=w11 +alpha*(1-zin1)*x1(i);
                     w2l=w21+alpha*(1-zin1)*x1(i);

                   else
                       b2=b2+alpha*(1-zin1);
                       w12=w12+alpha*(1-zin2)*x2(i);
 
                       w22=w22+alpha*(1-zin2)*x2(i);

                   end
               end

            if (t(i)==-1) 
               
                  if(zin1>0)
                     b1=b1+alpha*(-1-zin1);
                     w11=w11+alpha*(-1-zin1)*x1(i) ;
               
                     w21=w21+alpha*(-1-zin1)*x1(i);
                  else
                  
                      b2=b2+alpha*(-1-zin1);
                      w12=w12+alpha*(-1-zin2)*x2(i) ;
                    
                      w22=w22+alpha*(-1-zin2)*x2(i) ;
            
                  end
          
            end 
             end
            disp('    w11        w12        w21        w22');
            disp([w11,w12,w21,w22])

          
            end

            r(p)=mean(er)
           
            
end    

x=[1,2];
y=r;
plot(x,y)
title("Mean-Sq-Error Graph")     