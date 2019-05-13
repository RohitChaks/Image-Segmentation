
I = rgb2gray(imread('3.jpg'));
I = uint8(255*mat2gray(I));
%I = equalisation(I);
regions = 16;
r = floor(sqrt(regions));
figure,imshow(I)

thresh = multithresh(I, regions); 
fin = double(zeros(size(I)));
for i = 1:regions
    if (i==1)
        ans = (I<=thresh(i));
        subplot(4,5,1);imshow(ans);title(num2str(i));
    else
        ans = (I<=thresh(i)).*(I>thresh(i-1));
        subplot(4,5,i);
        imshow(ans);title(num2str(i));
    end
    %ans = double(ans).*double(I);
    if(i<(2*r)-1 && i>=r)
        fin = double(fin) + double(ans);
    end
end
fin = uint8(fin);

[L,n] = bwlabel(fin,4);
figure,imshow(L,[0,1]);
szof = zeros([1,n]);
for i=1:n
    t = (L==i);
    szof(i) = sum(t(:));
end

temp_szof = sort(szof,'descend');

figure;
for i=1:min(20,n)
    i
    
    find(szof == temp_szof(i))
    
    [r,c] = find(L == find(szof == temp_szof(i)));
    rc = [r c];
    l = min(rc(:,1));
    r = max(rc(:,1));
    u = min(rc(:,2));
    d = max(rc(:,2));
    
    t = zeros([(r-l+1),(d-u+1)]);
    t = I(l:r,u:d);
    t = equalisation(t);
    imshow(t);
    if i==1
        yeet = t;
    end
    if i==2
        yeet2 = t;
    end
end

figure,imshow(yeet);
figure,imshow(yeet2);