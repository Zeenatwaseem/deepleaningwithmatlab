clc;
clear all;
nw1 = [];
nw2 = [];
nwb=[];
x1=[1,1,-1,-1];
 %disp(x1)
 t=[1,-1,-1,-1];
 %disp(t)
 x2=[1,-1,1,-1];
 % disp(x2)
 
nw1(1)=(t(1)*x1(1))+0;
nw2(1)=(t(1)*x2(1))+0;
nwb(1)=(t(1)*1)+0;
for i=2:4
  nw1(i)= (t(i)*x1(i))+nw1(i-1);
  nw2(i)= (t(i)*x2(i))+nw2(i-1);
  nwb(i)=t(i)+nwb(i-1);  
end
disp(nw1) 
disp(nw2)
disp(nwb)
w1=nw1(4);
w2=nw2(4);
b=nwb(4);
netvalue=[]
%calculating net value
netvalue=w1*x1+w2*x2+b
fnet=[];
for i=1:4
    if netvalue(i)>=2
       fnet(i)=1
    else netvalue(i)<2
        fnet(i)=-1
   end
 end


