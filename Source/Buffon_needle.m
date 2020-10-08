function [ ] = Buffon_needle(n)

L=5;    %distance between two lines on the "floor"
needle_lenght=3;
p=pi;
crossed_counter=0;

for i=1:n
    x1=L*rand();
    alpha=2*p*rand();
    x2=x1+needle_lenght*cos(alpha);
    if x1>=0 && x2<=0 || x1<=L && x2>=L
        crossed_counter=crossed_counter+1;
    end
end

numeric_probability=crossed_counter/n;

theoretic_probability=(2*needle_lenght)/(L*p);
numeric_pi=(2*needle_lenght)/(L*numeric_probability);

disp(numeric_probability);
disp(theoretic_probability);
disp(numeric_pi);

end

end
