layers={'conv1','conv2','conv3','conv4','conv5','fc6','fc7','fc8'};
good=[conv1_good,conv2_good,conv3_good,conv4_good,conv5_good,fc6_good,fc7_good,fc8_good];

bad=[conv1_bad,conv2_bad,conv3_bad,conv4_bad,conv5_bad,fc6_bad,fc7_bad,fc8_bad];

v1good=zeros(1,8);
for i=1:8,
    mtxgood=good(:,(i-1)*6+1:(i-1)*6+6);
    co_v1good=corr2(v1_good,mtxgood);
    v1good(1,i)=co_v1good;
end

figure(1);
plot(v1good);
set(gca, 'Xticklabel',{'conv1','conv2','conv3','conv4','conv5','fc6','fc7','fc8'})


ppagood=zeros(1,8);
for i=1:8,
    mtxgood=good(:,(i-1)*6+1:(i-1)*6+6);
    co_ppagood=corr2(ppa_good,mtxgood);
    ppagood(1,i)=co_ppagood;
end

figure(2);
plot(ppagood);
set(gca, 'Xticklabel',{'conv1','conv2','conv3','conv4','conv5','fc6','fc7','fc8'})

v1bad=zeros(1,8);
for i=1:8,
    mtxbad=bad(:,(i-1)*6+1:(i-1)*6+6);
    co_v1bad=corr2(v1_bad,mtxbad);
    v1bad(1,i)=co_v1bad;
end

figure(3);
plot(v1bad);
set(gca, 'Xticklabel',{'conv1','conv2','conv3','conv4','conv5','fc6','fc7','fc8'})


ppabad=zeros(1,8);
for i=1:8,
    mtxbad=bad(:,(i-1)*6+1:(i-1)*6+6);
    co_ppabad=corr2(ppa_bad,mtxbad);
    ppabad(1,i)=co_ppabad;
end

figure(4);
plot(ppabad);
set(gca, 'Xticklabel',{'conv1','conv2','conv3','conv4','conv5','fc6','fc7','fc8'})