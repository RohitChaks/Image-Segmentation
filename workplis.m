fn = getfn('unseen_test', 'jpg$');
for i = 1:numel(fn)
  I = imread(fn{i});
  I = imresize(I, [276 230]); 
  ans = size(I);
  try 
      if ans(3) == 3
      I = rgb2gray(I);
     end
  end  
  img(:,:,i) = I;
  img_e(:,:,i) = equalisation(img(:,:,i));
  fn{i}
end
s = size(img)

for i = 1:s(3)
    t = img_e(:,:,i);    
    r = myfilter(t);
    imwrite(r,strcat(fn{i},'.jpg'));
end
