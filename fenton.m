%space-clamped Fenton model

dt=0.04;

% Param set 4
%P(1)=3.33;
%P(2)=15.6;
%P(3)=5.0;
%P(4)=350.0;
%P(5)=80.0;
%P(6)=0.407;
%P(7)=9.0;
%P(8)=34.0;
%P(9)=26.5;
%P(10)=15.0;
%P(11)=0.45;
%P(12)=0.15;
%P(13)=0.04;

% Param set 6
P(1)=3.33;
P(2)=9.0;
P(3)=8.0;
P(4)=250.0;
P(5)=60.0;
P(6)=0.395;
P(7)=9.0;
P(8)=33.33;
P(9)=29.0;
P(10)=15.0;
P(11)=0.5;
P(12)=0.13;
P(13)=0.04;


block = 0.0;


Cm=1.00;

Ifi=0.00; Iso=0.00; Isi=0.0;
V=0.00; nu=1.00; w=1.00;
Istim=0.00;

ind=1;
for time=0.0:dt:500.0
    
    if time<3.01
        Istim=1.0*(-0.12);
    else
        Istim=0.0;
    end
    
    if V>=P(13)
        tau=P(3);
    else
        tau=P(2);
    end
    
    if V>=P(12)
        Ifi=-nu*(V-P(12))*(1.0-V)/P(6);
        Iso=1.0/P(8);
        Isi=-w*(1.0+tanh(P(10)*(V-P(11))))/(2.0*P(9));
        nu=nu*(1.0-dt/P(1));
        w=w*(1.0-dt/P(4));
    else
        Ifi=0.0;
        Iso=V/P(7);
        Isi=-w*(1.0+tanh(P(10)*(V-P(11))))/(2.0*P(9));
        nu=nu+dt*(1.0-nu)/tau;
        w=w+dt*(1.0-w)/P(5);
    end
    
    if V>=1.25
        Iso=Iso+(V-1.25)/(1.25*P(8));
    end
    
    Isi = Isi*(1-block);
    Vnew=V-dt*(Ifi+Iso+Isi+Istim)/Cm;
    V=Vnew;
    
    t(ind)=time;
    u(ind)=V;
    ind=ind+1;
    
end