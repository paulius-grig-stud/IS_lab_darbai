%pasirenkami parametrai
c1 = 0.19; c2 = 0.92;   %centrai
r1 = 0.15;   r2 = 0.15; %spinduliai
n = 0.01;            %mokymo zingsnis
e = zeros(1,20);

%Numatytos vertes
x = 0.1:1/22:1;
d = ((1+0.6*sin(2*pi*x/0.7))+ 0.3*sin(2*pi*x))/2;
F1 = exp(-(x-c1).^2/(2*r1^2));
F2 = exp(-(x-c2).^2/(2*r2^2));

%w
w1 = rand(1);
w2 = rand(1);
w0 = rand(1);
y = F1*w1 + F2*w2 + w0;
for k = 1:1000
    for i = 1:20
        %skaiciavimai
        e=d(i)-y(i);
        w1 = w1 + n*e*F1(i);
        w2 = w2 + n*e*F2(i);
        w0 = w0 + n*e;
        y(i) = F1(i)*w1 + F2(i)*w2 + w0;
    end
end


figure(1)
plot(1:20,y,'ko',1:20,d,'rx')


x = 0.1:1/42:1;
d = ((1+0.6*sin(2*pi*x/0.7))+ 0.3*sin(2*pi*x))/2;
F1 = exp(-(x-c1).^2/(2*r1^2));
F2 = exp(-(x-c2).^2/(2*r2^2));
y = F1*w1 + F2*w2 + w0;
figure(2)
plot(1:38,y,'ko',1:38,d,'rx')