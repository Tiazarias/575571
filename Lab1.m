
%dog1 Labrador Retriever
%dog2 German Shepherd
%dog3 Golden Retriever
%dog4 French Bulldog
%dog5 Bulldog
%dog6 Beagle
%dog7 Poodle
%dog8 Rottweiler
dog1 = imread('dog1.jpg');
dog2 = imread('dog2.jpg');
dog3 = imread('dog3.jpg');
dog4 = imread('dog4.jpg');
dog5 = imread('dog5.jpg');
dog6 = imread('dog6.jpg');
dog7 = imread('dog7.jpg'); 
dog8 = imread('dog8.jpg');       % Take a picture
subplot(2,4,1),deeppic(dog1)
subplot(2,4,2),deeppic(dog2)
subplot(2,4,3),deeppic(dog3)
subplot(2,4,4),deeppic(dog4)
subplot(2,4,5),deeppic(dog5)
subplot(2,4,6),deeppic(dog6)
subplot(2,4,7),deeppic(dog7)
subplot(2,4,8),deeppic(dog8)
function deeppic(im)
    net = alexnet;
    image(im);                   % Show the picture
    im = imresize(im,[227 227]); % Resize the picture for alexnet
    label = classify(net,im);    % Classify the picture
    title(char(label));          % Show the class label
end
