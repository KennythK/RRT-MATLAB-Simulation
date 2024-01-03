

function robot_plot(pos,dir,obstacle)

%Calculate row and column robot position
          
row = floor(pos/4);
col = mod(pos,4);


%Grid creation using a for loop

for i=0:3
    rectangle('position',[i,0,1,1],'FaceColor',[1 1 1])
    for j=0:3
         rectangle('position',[i,j,1,1],'FaceColor',[1 1 1])
    end
end



%Populate grid with obstacles using for loop

possible = zeros(1,16); %location possibilities

for i=1:16
    possible(i) = i;
end

% obstacle plot

for i=1:length(obstacle)
    if obstacle(i) >= 0 && ismember(obstacle(i),possible) ~= 0
        %obs_row = coordinate(obstacle(i),1);
        %obs_col = coordinate(obstacle(i),2)+1;
        obs_row = floor(obstacle(i)/4);
        obs_col = mod(obstacle(i),4);

         rectangle('Position',[obs_col+0.1, obs_row+0.1, 0.8, 0.8]...
        ,'FaceColor',[0.5 0.67 0.95])
    end
    
end

% 'EdgeColor','b','LineWidth',1.5
%Add text to plot

 text(3.5,0.5,'3')
 text(2.5,0.5,'2')
 text(1.5,0.5,'1')
 text(0.5,0.5,'0')
 
 text(3.5,1.5,'7')
 text(2.5,1.5,'6')
 text(1.5,1.5,'5')
 text(0.5,1.5,'4')
 
 text(3.5,2.5,'11')
 text(2.5,2.5,'10')
 text(1.5,2.5,'9')
 text(0.5,2.5,'8')
 
 text(3.5,3.5,'15')
 text(2.5,3.5,'14')
 text(1.5,3.5,'13')
 text(0.5,3.5,'12')
%if-else statements to place the robot in the correct orientation

%col = col-1;
%row = row-1;

if dir == 0
    rectangle('Position',[col+0.2,row+0.3,.1,.4],'FaceColor',[1 0 0])
    rectangle('Position',[col+0.3,row+.2,0.4,0.6],'FaceColor',[0.5 0.5 0.5])
    rectangle('Position',[col+0.7,row+0.3,.1,.4],'FaceColor',[1 0 0])
    rectangle('Position',[col+0.4,row+0.7,0.2,0.1],'FaceColor',[1 1 0])
elseif dir == 1
    rectangle('Position',[col+0.3,row+0.2,.4,.1],'FaceColor',[1 0 0])
    rectangle('Position',[col+0.2,row+.3,0.6,0.4],'FaceColor',[0.5 0.5 0.5])
    rectangle('Position',[col+0.3,row+0.7,.4,.1],'FaceColor',[1 0 0])
    rectangle('Position',[col+0.2,row+0.4,0.1,0.2],'FaceColor',[1 1 0])
elseif dir == 2
    rectangle('Position',[col+0.2,row+0.3,.1,.4],'FaceColor',[1 0 0])
    rectangle('Position',[col+0.3,row+.2,0.4,0.6],'FaceColor',[0.5 0.5 0.5])
    rectangle('Position',[col+0.7,row+0.3,.1,.4],'FaceColor',[1 0 0])
    rectangle('Position',[col+0.4,row+0.2,0.2,0.1],'FaceColor',[1 1 0])
elseif dir == 3
    rectangle('Position',[col+0.3,row+0.2,.4,.1],'FaceColor',[1 0 0])
    rectangle('Position',[col+0.2,row+.3,0.6,0.4],'FaceColor',[0.5 0.5 0.5])
    rectangle('Position',[col+0.3,row+0.7,.4,.1],'FaceColor',[1 0 0])
    rectangle('Position',[col+0.7,row+0.4,0.1,0.2],'FaceColor',[1 1 0])
end

pbaspect([1 1 1]);
axis([0 4 0 4]);
set(gca,'XTick',[] );
set(gca,'YTick',[] );

