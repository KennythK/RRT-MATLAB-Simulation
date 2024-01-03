function data = robot_sim_server(command)


%robot can achieve this succesfully
% obstacle = [12 13 14 15];
% obstacle = [1 5 6 10];
% obstacle = [9 5 6 3];
 % obstacle = [14 10  6 2];
% obstacle = [9 10 5 3];
% obstacle = [1 12 15 3];
% obstacle = [1 2 3 15];
% obstacle = [12 9 10 15];
% obstacle = [12 13 14 3];
 obstacle = [1,5,6,11];
% obstacle = [4 6 10 15];

% persistent obstacle;
% if isempty(obstacle)
%     obstacle = randperm(15,4);
% end


persistent num_moves; 
persistent pos;
persistent dir; 

if isempty(pos)||isempty(dir)
    pos = 0;
    dir = 0;
    num_moves = 0; 
end 



switch command
    
    case "sensor_read"
         data=sensor_read(pos,dir,obstacle); 
         
    case "move 0"
        
        data = move(pos,dir,0);
        pos = data(1);
        dir = data(2);
        num_moves = num_moves + 1; 
        
    case "move 1"
        
        data = move(pos,dir,1);
        pos = data(1);
        dir = data(2);
        num_moves = num_moves + 1; 
        
        
    case "move 2"
        data = move(pos,dir,2);
        pos = data(1);
        dir = data(2);
        num_moves = num_moves + 1; 
        
    case "status"
        data = [pos dir num_moves];
        
    
end 

return