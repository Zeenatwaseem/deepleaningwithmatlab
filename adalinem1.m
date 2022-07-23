
function adaline1
%input array
ar =  [0 0 1 1; 0 1 0 1];
   
% target array
t = [ 0, 1, 1, 1 ];
err=[];
 % taking bias in each case as 1

 %consider learning rate = 0.2
 w1 = 0.2; w2 = 0.2; 
 b = 0.2;
 yi=[];

 mse=[];
  
for i =1:10

    
        disp( "EPOCH ") 
        disp(i  )
       
      for j =1:4
           
            % calculating net input
             yi(j) = ar(1,j) * w1 + ar(2,j) * w2 + 1 * b;
             
             dif = t(j) - yi(j);
             err(j) = dif * dif;
             if(err(j)~=0)
            
                 %updated weights
                 w1 =w1+ 0.2  *dif *ar(1,j) ;
                 w2 =w2+ 0.2 * dif * ar(2,j) ;
                 b = b+0.2 * dif * 0.2;
                 

             else
                 w1=w1;
                 w2=w2;
                 b=b;
             end
       
       disp('w1:');
       disp(w1);
       disp('w2:');
       disp(w2);
         
       
      end
       disp(" Errors" )
       disp(err);
       
           er=err(1)+err(2)+err(3)+err(4);
           mse(i)=er;
           disp(er)
           
          
end
 


t
for p =1:4
    final(1,p)=w1*ar(1,p)+w2*ar(2,p)+b;
end
final;
round(final)
x=[1,2,3,4,5,6,7,8,9,10];
y=mse;
plot(x,y,'*')
title("Mean-Sq-Error Graph 1")
 