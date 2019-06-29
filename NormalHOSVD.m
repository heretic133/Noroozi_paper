index=5;
emci1=emci;
emci1(:,:,index)=[];
normal1=normal;
normal1(:,:,end+1)=emci(:,:,index);

E=tensor(emci);
E1=tensor(emci1);
N=tensor(normal);
N1=tensor(normal1);
[C1,Ue1,S1]=hosvd(N1,[130,116,38]);
[C,Ue1,S1]=hosvd(N,[130,116,38]);
[Ce,Ue1,S1]=hosvd(E,[130,116,43]);
[Ce1,Ue1,S1]=hosvd(E1,[130,116,43]);
Test=emci(:,:,index);
for i=1:38
Tempn=double(C(:,:,i));
Tempn1=double(C1(:,:,i));
n(i)=corr(Tempn(:),Test(:));
n2(i)=corr(Tempn1(:),Test(:));
end;

for i=1:43

Tempe=double(Ce(:,:,i));
Tempe1=double(Ce1(:,:,i));
e(i)=corr(Tempe(:),Test(:));
e2(i)=corr(Tempe1(:),Test(:))
end;
plot(n,'-*')
hold on
plot(e,'-o')