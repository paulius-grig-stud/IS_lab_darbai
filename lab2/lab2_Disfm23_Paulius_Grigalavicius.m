clear
clc
% duomenys paruosiami simuliuti sistemos isejima,
x = [0.1:0.0455:1];
d = (1 + 0.6*sin(2*pi*x/0.7) + 0.3*sin(2*pi*x)) / 2;
plot(1:20,d,'kx')
% tinklo strukturos pasirinkimas
% 1 iejimas, 5 neuronai pasleptame sluoksny, 1 isejimaw
% pradines reiksmes
% I sluoksnis (pasleptasis)
w11_1 = randn(1); b1_1 = randn(1);
w21_1 = randn(1); b2_1 = randn(1);
w31_1 = randn(1); b3_1 = randn(1);
w41_1 = randn(1); b4_1 = randn(1);
w51_1 = randn(1); b5_1 = randn(1);
% II sluoksnis 
w11_2 = randn(1); w12_2= randn(1); w13_2 = randn(1); w14_2 = randn(1); w15_2 = randn(1); b1_2 = randn(1);
n = 0.1; % mokymo zingsnis
%tinklo atsakas ir isejimas
for k = 1:5000
    for index = 1:20
        % I sluoksnis  - tan
        v1_1 = x(index)*w11_1 + b1_1 ; y1_1 = tanh(v1_1);
        v2_1 = x(index)*w21_1 + b2_1 ; y2_1 = tanh(v2_1);
        v3_1 = x(index)*w31_1 + b3_1 ; y3_1 = tanh(v3_1);
        v4_1 = x(index)*w41_1 + b4_1 ; y4_1 = tanh(v4_1);
        v5_1 = x(index)*w51_1 + b5_1 ; y5_1 = tanh(v5_1);
        % II sluoksnis  - tiesine aktyv*w11_2 avimo funkcija
        v1_2 = y1_1+ y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 + y5_1*w15_2 + b1_2; 
        y1_2 = v1_2;
        % II isejimas
        y(index) = y1_2;
        % Klaidos skaiciavimas 
        e = d(index)-y1_2;
        % Gradient (tiesine isvestine)
        delta1_2 = e;
        % delta_hidden (tan isvestine)
        delta1_1 = (1 - (tanh(y1_1))^2)*delta1_2*w11_2;
        delta2_1 = (1 - (tanh(y2_1))^2)*delta1_2*w12_2;
        delta3_1 = (1 - (tanh(y3_1))^2)*delta1_2*w13_2;
        delta4_1 = (1 - (tanh(y4_1))^2)*delta1_2*w14_2;
        delta5_1 = (1 - (tanh(y5_1))^2)*delta1_2*w15_2;

        %Atnaujinimas
        w11_2 = w11_2 + n*e*y1_1;
        w12_2 = w12_2 + n*e*y2_1;
        w13_2 = w13_2 + n*e*y3_1;
        w14_2 = w14_2 + n*e*y4_1;
        w15_2 = w15_2 + n*e*y5_1;
        b1_2 = b1_2 + n*e*1;

        w11_1 = w11_1 + n*delta1_1*x(index); b1_1 = b1_1 + n*delta1_1*1;
        w21_1 = w21_1 + n*delta2_1*x(index); b2_1 = b2_1 + n*delta2_1*1;
        w31_1 = w31_1 + n*delta3_1*x(index); b3_1 = b3_1 + n*delta3_1*1;
        w41_1 = w41_1 + n*delta4_1*x(index); b4_1 = b4_1 + n*delta4_1*1;
        w51_1 = w51_1 + n*delta5_1*x(index); b5_1 = b5_1 + n*delta5_1*1;
    end
end
figure(1)
plot(1:20,y,'ko',1:20,d,'rx')

figure(2)
plot(1:20,y,'k',1:20,d,'r')

x1 = [0.1:1/222:1];

for index = 1:200
        % I sluoksnis  - tan
        v1_1 = x1(index)*w11_1 + b1_1 ; y1_1 = tanh(v1_1);
        v2_1 = x1(index)*w21_1 + b2_1 ; y2_1 = tanh(v2_1);
        v3_1 = x1(index)*w31_1 + b3_1 ; y3_1 = tanh(v3_1);
        v4_1 = x1(index)*w41_1 + b4_1 ; y4_1 = tanh(v4_1);
        v5_1 = x1(index)*w51_1 + b5_1 ; y5_1 = tanh(v5_1);
        % II sluoksnis  - tiesine aktyv*w11_2 avimo funkcija
        v1_2 = y1_1+ y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 + y5_1*w15_2 + b1_2; 
        y1_2 = v1_2;
        % II isejimas
        y1(index) = y1_2;
end

figure(3)
plot(1:200,y1,'k',1:200,d,'r')

