
clear
figure
obj_pos = [];

clear robot_sim_server;   % reset simulation 

while length(obj_pos)<4
    % sense 
    
    result = robot_sim_server("status");
    pos = result(1)
    dir = result(2)
    num_moves = result(3)
    obj_pos
    robot_plot(pos,dir,obj_pos);
    pause
    
    
    % sense
    sensor_data = robot_sim_server("sensor_read")
    
   % plan and act
    if sensor_data(2)==0
       result = robot_sim_server("move 1");
    elseif sensor_data(3)==0
        result = robot_sim_server("move 2");
        
    end 
    
    % object detection
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if (dir==0)
        if sensor_data(2)==1
            if ismember(pos+4,obj_pos)==0 % check if the object is already in the list
            obj_pos = [obj_pos pos+4];
            end
        end 
        if sensor_data(1)==1
            if ismember(pos-1,obj_pos)==0 % check if the object is already in the list
            obj_pos = [obj_pos pos-1];
            end
        end
        if sensor_data(3)==1
            if ismember(pos+1,obj_pos)==0 % check if the object is already in the list
            obj_pos = [obj_pos pos+1];
      
           end  
        end 
    
    
    
    elseif (dir ==3)
        
        if sensor_data(2)==1
            if ismember(pos+1,obj_pos)==0 % check if the object is already in the list
            obj_pos = [obj_pos pos+1];
            end
        elseif sensor_data(1)==1
            if ismember(pos+4,obj_pos)==0 % check if the object is already in the list
            obj_pos = [obj_pos pos+4];
            end
       elseif sensor_data(3)==1
            if ismember(pos-1,obj_pos)==0 % check if the object is already in the list
            obj_pos = [obj_pos pos-1];
      
            end 
        
        end 
    end 
        
        
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
end