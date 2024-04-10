% [X,Y,Z] = meshgrid();
% 
% isosurface(X,Y,Z,Pbeam2d)
% colorbar
% 
% 
% [f,v] = isosurface(X,Y,Z,Pbeam2d);
% patch('Faces',f,'Vertices',v)
% 
clear all

% isovalue
computer=2;

if computer==1


pro_path = "/tudelft.net/staff-groups/ewi/me/MS3/Studenten/2022 Sen Yuan";

else if computer==2
pro_path = "W:\staff-groups\ewi\me\MS3\Studenten\2022 Sen Yuan";

else if computer==3
pro_path = "M:\ewi\me\MS3\Studenten\2022 Sen Yuan";
  
else if computer==4
pro_path = "/Volumes/SFTP/staff-groups/ewi/me/MS3/Studenten/2022 Sen Yuan";
    end 
    end
    end
end
addpath(strcat(pro_path,'/Copy_of_joint_ego_doppler_3D'))

load(strcat(pro_path,'/model/human.mat'))
data1=data/90;
% data1=(data1).*[2*1/max(data1(1,:)) ;4*1/max(data1(2,:)); 4*1/max(data1(3,:))];
data1=(data1);%.*[1*1/(max(data1(1,:))-min(data1(1,:))) ;1*1/(max(data1(2,:))-min(data1(2,:))); 1*1/(max(data1(3,:))-min(data1(3,:)))];



Xc=-data1(3,1:10:end);%8
Yc=data1(1,1:10:end);%4
Zc=data1(2,1:10:end);%2
% Xc=-data1(3,:);%8
% Yc=data1(1,:);%4
% Zc=data1(2,:);%2
Xc_center=5;
Yc_center=0;
Zc_center=0;
X=Xc+Xc_center;
Y=Yc+Yc_center;
Z=Zc+Zc_center;

% Xgrid=min(X)-1:0.05:max(X)+1;
% Ygrid=min(Y)-1:0.05:max(Y)+1;
% Zgrid=min(Z)-1:0.05:max(Z)+1;


Xgrid=min(X)-0.1:0.05:max(X)+0.1;
Ygrid=min(Y)-0.1:0.05:max(Y)+0.1;
Zgrid=min(Z)-0.1:0.05:max(Z)+0.1;
%  [h,XMesh,YMesh,ZMesh]=density2C(X,Y,Xgrid,Ygrid);
 
 
Target.R=sqrt(X.^2+Y.^2+Z.^2);
Target.theta=atand(Y./X);
Target.phi=asind(Z./Target.R);
Target.Zc=300*rand(1,size(Target.R,2));
%  [h,XMesh,YMesh,ZMesh]=density2C(X,Y,Xgrid,Ygrid);
%  [ h ] = MeanVarQuantization( h1,1);

[h,XMesh,YMesh,ZMesh]=density2C(X,Y,Xgrid,Ygrid);
figure
% surf(X,Y,Z)
swarmchart3(Y,X,Z,50,h,'filled');
view([-0.1,0,1])
xlabel('X (m)' )
ylabel('Y (m)'  )
zlabel('Z (m)' )
xlim([-0.7 0.7])
% zlim([0 2.4])
ylim([4.4 5.6])
saveas(gcf,strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\yxviewgroundhumanding.fig'))
% set(gcf,'InvertHardCopy','off')
print(strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\yxviewgroundhumanding'),'-depsc')

[h,XMesh,YMesh,ZMesh]=density2C(Y,Z,Ygrid,Zgrid);
figure
% surf(X,Y,Z)
swarmchart3(Y,X,Z,50,h,'filled');
view([-0.1,1,-0.1])
xlabel('X (m)' )
ylabel('Y (m)'  )
zlabel('Z (m)' )
xlim([-0.7 0.7])
% zlim([0 2.4])
ylim([4.4 5.6])
saveas(gcf,strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\xzviewgroundhumanding.fig'))
% set(gcf,'InvertHardCopy','off')
print(strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\xzviewgroundhumanding'),'-depsc')

[h,XMesh,YMesh,ZMesh]=density2C(X,Z,Xgrid,Zgrid);
figure
% surf(X,Y,Z)
swarmchart3(Y,X,Z,50,h,'filled');
view([1,-0.1,-0.1])
xlabel('X (m)' )
ylabel('Y (m)'  )
zlabel('Z (m)' )
saveas(gcf,strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\yzviewgroundhumanding.fig'))
% set(gcf,'InvertHardCopy','off')
print(strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\yzviewgroundhumanding'),'-depsc')



% figure
% % scatter3(X,Y,Z)
% swarmchart3(Y,X,Z,50,h,'filled');
% view([-0.1,0,1])
% xlabel('X (m)' )
% ylabel('Y (m)'  )
% zlabel('Z (m)' )
% colmp_type = 'jet';
% colormap(colmp_type)
% saveas(gcf,strcat(pro_path,'/Copy_of_joint_ego_doppler_3D\figure_ieeetrssi\CARMODEL.fig'))
% print(strcat(pro_path,'/Copy_of_joint_ego_doppler_3D\figure_ieeetrssi\CARMODEL'),'-depsc')

% figure
% scatter3(X,Y,Z)

R_max=max(Target.R);
R_min=min(Target.R);
theta_max=max(Target.theta);

theta_min=min(Target.theta);
phi_max=max(Target.phi);
phi_min=min(Target.phi);

t_max=900+floor(theta_max*10);
t_min=900+floor(theta_min*10);

p_max=900+floor(phi_max*10);
p_min=900+floor(phi_min*10);
% load(strcat(pro_path,'/New Folder/r.mat'),'r')
load('r512.mat')
 inde_t=sign(R_max-r);
        [p,I]=find(inde_t==-1);
             iii1=(isempty(p)*1+(~isempty(p))*min(p));
        iii2=[2048,iii1];
        iii_h=(min(iii2)==2048)*1+(min(iii2)~=2048)*min(iii2);
 inde_t=sign(R_min-r);
        [p,I]=find(inde_t==-1);
             iii1=(isempty(p)*1+(~isempty(p))*min(p));
        iii2=[2048,iii1];
        iii_l=(min(iii2)==2048)*1+(min(iii2)~=2048)*min(iii2);

R=r(iii_l-6):0.15:r(iii_h+6);
theta=-90:1:90;
phi=-90:1:90;

[meshr,mesht,meshp] = meshgrid(theta,R,phi);
load('main_simulated_humanding_sidelooking.mat')
Pyy_2=Pbeam_modify;
Rn=r(iii_l-6):0.05:r(iii_h+6);
thetan=-90:0.1:90;
phin=-90:0.1:90;

[x,y,z] = ndgrid(R,theta,phi);
[xq,yq,zq]  = ndgrid(Rn,thetan,phin);
% q = interpn(x,y,z, q1, xq,yq,zq)


% [meshrn,meshtn,meshpn] = meshgrid(thetan,Rn,phin);
Pbeam2dupsam=interpn(x,y,z,Pbeam2d(1:17,:,:),xq,yq,zq,'cubic');
Pyy_2upsam=interpn(x,y,z,Pyy_2(1:17,:,:),xq,yq,zq,'cubic');
clear Pbeam2dd Pyy2dd



for i_x=1:length(Xgrid)
    for i_y=1:length(Ygrid)
        for i_z=1:length(Zgrid)
    R1=sqrt(Xgrid(i_x).^2+Ygrid(i_y).^2+Zgrid(i_z).^2);
    theta1=atand(Ygrid(i_y)./Xgrid(i_x));
    phi1=asind(Zgrid(i_z)./R1);
    [m,nr]=min(abs(R1-Rn));
    [m,nthe]=min(abs(theta1-thetan));
     [m,nph]=min(abs(phi1-phin));
    Pbeam2dd(i_x,i_y,i_z)=Pbeam2dupsam(nr,nthe,nph);
   Pyy2dd(i_x,i_y,i_z)=Pyy_2upsam(nr,nthe,nph);


        end
    end
end

[meshx,meshy,meshz] = meshgrid(Ygrid,Xgrid,Zgrid);
quantization_num=1;
[ Pbeam2dd1 ] = MeanVarQuantization( Pbeam2dd,quantization_num);

ImagNormPbeam2dd= abs(Pbeam2dd1)./max(Pbeam2dd1(:));
meshy=(meshy-min(meshy(:)))*5/0.15+min(meshy(:));


ImagNorm_dBPbeam2dd = db(ImagNormPbeam2dd);
figure
hs = slice(meshx,meshy,meshz,ImagNorm_dBPbeam2dd,[],1:size(Pbeam2dd,1),[]);

xlabel('X (m)' )
ylabel('Y (m)'  )
zlabel('Z (m)' )
yticks([1:8:size(ImagNormPbeam2dd,1)])
c=4.8:0.2:5.2;
% xlim([1.2 2.5])
% zlim([0 2.4])
% c=2.1:0.4:2.9;
yticklabels(c)
view([-0.1,1,-0.1])

set(hs,'FaceColor','interp','EdgeColor','none');
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 4 3],'PaperSize',[4 3])
axis vis3d;
% axis([0.3 0.7 0.3 0.7  1.8 2.2])
% alpha('color')
for kk=1:size(Pbeam2dd,1)
    set(hs(kk),'AlphaData',...
        squeeze(ImagNormPbeam2dd(kk,:,:)),'FaceAlpha','interp');
end
colmp_type = 'jet';
colormap(colmp_type)
hc = colorbar
caxis([-50 0])
saveas(gcf,strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\xzviewmimohumanding.fig'))
% set(gcf,'InvertHardCopy','off')
print(strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\xzviewmimohumanding'),'-depsc')



[meshx,meshy,meshz] =  meshgrid(Ygrid,Xgrid,Zgrid);
quantization_num=1;

[ Pyy2dd1 ] = MeanVarQuantization( Pyy2dd,quantization_num);

ImagNormPyy2dd= abs(Pyy2dd1)./max(Pyy2dd1(:));
meshy=(meshy-min(meshy(:)))*5/0.15+min(meshy(:));
% [ ImagNormPyy2dd ] = MeanVarQuantization( Pyy2dd,3 );
% ImagNormPyy2dd= abs(ImagNormPyy2dd)./max(ImagNormPyy2dd(:));

ImagNorm_dBPyy2dd = db(ImagNormPyy2dd);
% 
% for i =1:98
% ImagNormPyy2dd(i,:,:)= abs(Pyy2dd(i,:,:))./max(Pyy2dd(i,:,:));
% end

figure
hs = slice(meshx,meshy,meshz,ImagNorm_dBPyy2dd,[],1:size(Pbeam2dd,1),[]);
xlabel('X (m)' )
ylabel('Y (m)'  )
zlabel('Z (m)' )
yticks([1:8:size(ImagNormPbeam2dd,1)])
c=4.8:0.2:5.2;

% xlim([1.2 2.5])
% zlim([0 2.4])
% c=2.1:0.4:2.9;
yticklabels(c)
view([-0.1,1,-0.1])
set(hs,'FaceColor','interp','EdgeColor','none');
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 4 3],'PaperSize',[4 3])
axis vis3d;
% axis([0.3 0.7 0.3 0.7  1.8 2.2])
% alpha('color')
% xlim([1 3.5])
% ylim([0.5 4])


for kk=1:size(Pbeam2dd,1)
    set(hs(kk),'AlphaData',...
        squeeze(ImagNormPyy2dd(kk,:,:)),'FaceAlpha','interp');
end
colmp_type = 'jet';
colormap(colmp_type)
hc = colorbar
caxis([-50 0])

saveas(gcf,strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\xzviewprohumanding.fig'))
% set(gcf,'InvertHardCopy','off')
print(strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\xzviewprohumanding'),'-depsc')

[meshx,meshy,meshz] = meshgrid(Ygrid,Xgrid,Zgrid);
quantization_num=1;
[ Pbeam2dd1 ] = MeanVarQuantization( Pbeam2dd,quantization_num);

ImagNormPbeam2dd= abs(Pbeam2dd1)./max(Pbeam2dd1(:));
meshz=(meshz-min(meshz(:)))*5/0.15+min(meshz(:));

ImagNorm_dBPbeam2dd = db(ImagNormPbeam2dd);
figure
hs = slice(meshx,meshy,meshz,ImagNorm_dBPbeam2dd,[],[],1:size(Pbeam2dd,3));

xlabel('X (m)' )
ylabel('Y (m)' )
zlabel('Z (m)' )
zticks([1:20:size(ImagNormPbeam2dd,3)])
c=0:1:2.5;
zticklabels(c)
% 
xlim([-0.7 0.7])
% zlim([0 2.4])
ylim([4.4 5.6])
% xlim([1.2 2.5])
% ylim([2 3])
view([-0.1,0,1])
set(hs,'FaceColor','interp','EdgeColor','none');
% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 4 3],'PaperSize',[4 3])
axis vis3d;
% axis([0.3 0.7 0.3 0.7  1.8 2.2])
% alpha('color')
for kk=1:size(Pbeam2dd,3)
    set(hs(kk),'AlphaData',...
        squeeze(ImagNormPbeam2dd(:,:,kk)),'FaceAlpha','interp');
end
colmp_type = 'jet';
colormap(colmp_type)
hc = colorbar
caxis([-50 0])

saveas(gcf,strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\yxviewhumanding.fig'))
% set(gcf,'InvertHardCopy','off')
print(strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\yxviewmimohumanding'),'-depsc')


[meshx,meshy,meshz] =  meshgrid(Ygrid,Xgrid,Zgrid);

[ Pyy2dd1 ] = MeanVarQuantization( Pyy2dd,quantization_num);

ImagNormPyy2dd= abs(Pyy2dd1)./max(Pyy2dd1(:));
meshz=(meshz-min(meshz(:)))*5/0.15+min(meshz(:));
% [ ImagNormPyy2dd ] = MeanVarQuantization( Pyy2dd,3 );
% ImagNormPyy2dd= abs(ImagNormPyy2dd)./max(ImagNormPyy2dd(:));

ImagNorm_dBPyy2dd = db(ImagNormPyy2dd);
% 
% for i =1:98
% ImagNormPyy2dd(i,:,:)= abs(Pyy2dd(i,:,:))./max(Pyy2dd(i,:,:));
% end

figure
hs = slice(meshx,meshy,meshz,ImagNorm_dBPyy2dd,[],[],1:size(Pbeam2dd,3));
% xlim([1.2 2.5])
% ylim([2 3])
view([-0.1,0,1])
xlabel('X (m)' )
ylabel('Y (m)'  )
zlabel('Z (m)' )
zticks([1:20:size(ImagNormPbeam2dd,3)])
c=0:1:2.5;
zticklabels(c)
xlim([-0.7 0.7])
% zlim([0 2.4])
ylim([4.4 5.6])
set(hs,'FaceColor','interp','EdgeColor','none');
% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 4 3],'PaperSize',[4 3])
axis vis3d;
% axis([0.3 0.7 0.3 0.7  1.8 2.2])
% alpha('color')
for kk=1:size(Pbeam2dd,3)
    set(hs(kk),'AlphaData',...
        squeeze(ImagNormPyy2dd(:,:,kk)),'FaceAlpha','interp');
end
colmp_type = 'jet';
colormap(colmp_type)
hc = colorbar
caxis([-50 0])
saveas(gcf,strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\yxviewprohumanding.fig'))
% set(gcf,'InvertHardCopy','off')
print(strcat(pro_path,'\Copy_of_New Folder\IEEETGRS\image\yxviewprohumanding'),'-depsc')



