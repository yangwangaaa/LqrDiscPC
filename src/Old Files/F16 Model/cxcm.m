function [CX,CM]=cxcm(alfa,dele)
%this function does table lookup
%[CX,CM]=cxcm(alfa,dele)

Ax=[-.099 -.081 -.081 -.063 -.025 .044 .097 .113 .145 .167 .174 .166
    -.048 -.038 -.040 -.021  .016 .083 .127 .137 .162 .177 .179 .167
    -.022 -.020 -.021 -.004  .032 .094 .128 .130 .154 .161 .155 .138
    -.040 -.038 -.039 -.025  .006 .062 .087 .085 .100 .110 .104 .091
    -.083 -.073 -.076 -.072 -.046 .012 .024 .025 .043 .053 .047 .040];
%
Am=[.205  .168  .186  .196  .213  .251  .245  .238  .252  .231  .198  .192
    .081  .077  .107  .110  .110  .141  .127  .119  .133  .108  .081  .093
   -.046 -.020 -.009 -.005 -.006  .010  .006 -.001  .014     0 -.013  .032
   -.174 -.145 -.121 -.127 -.129 -.102 -.097 -.113 -.087 -.084 -.069 -.006
   -.259 -.202 -.184 -.193 -.199 -.150 -.160 -.167 -.104 -.076 -.041 -.005];
%
s=.2*alfa;
k=fix(s);
if k<=-2
  k=-1;
elseif k>=9
  k=8;
end
da=s-k;
L=k+fix(1.1*sign(da));
s=dele/12;
m=fix(s);
if m<=-2
  m=-1;
elseif m>=2
  m=1;
end
de=s-m;
n=m+fix(1.1*sign(de));
k=k+3;
L=L+3;
m=m+3;
n=n+3;
%
% CX
%
t=Ax(m,k);
u=Ax(n,k);
v=t+abs(da)*(Ax(m,L)-t);
w=u+abs(da)*(Ax(n,L)-u);
CX=v+(w-v)*abs(de);
%
% CM
%
t=Am(m,k);
u=Am(n,k);
v=t+abs(da)*(Am(m,L)-t);
w=u+abs(da)*(Am(n,L)-u);
CM=v+(w-v)*abs(de);

