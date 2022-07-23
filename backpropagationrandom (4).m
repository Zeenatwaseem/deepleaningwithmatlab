clc
clear
noin = 2;
in = [-1 -1;-1 1;1 -1;1 1];
t = [-1 1 1 1];
noh = 3;
wij = rand(noin,noh);
biash = rand(1,noh);
vij = rand(1,noh);
biaso = rand(1);
lr = 0.25;
for epoch = 1:5
    for i=1:size(in,1)
        zin = in(i,:) * wij + biash;
        z = Sigmoid(zin);
        yin = z * vij' + biaso;
        y = Sigmoid(yin);
        o(i)=y;

        error = t(i)-y;
        del = error * SigmoidDerivative(yin);
        delin = del .* vij;
        delj = delin  .* SigmoidDerivative(zin);

        dvij = lr .* ( del .* z);
        vij = vij + dvij;
        dbiaso = lr * del;
        biaso = biaso + dbiaso;
        dwij = lr .* ( delj' * in(i,:) );
        wij = wij + dwij';
        db = lr .* delj;
        biash = biash + db;
        er(i)=error^2;
    end
    errr(epoch)=mean(er);
    fprintf('Epoch %d , mse = %.4f\n',epoch,errr(epoch));
end

plot(errr)
function[output]=Sigmoid(input)
output=(exp(input)-exp(-input))./(exp(input)+exp(-input));
end

function[output]=SigmoidDerivative(input)
output=(1-Sigmoid(input).^2);
end