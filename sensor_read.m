
function sensor_val = read_sensor(pos,dir,obstacle)

if ismember(pos,obstacle)
    sensor_val = -1;
    return
end 

row = floor(pos/4);
col = mod(pos,4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if dir==0
    
    % get left sensor position
     if col>0
        left_pos = pos - 1;
    else 
        left_pos = -1;
     end    
     
    % get front sensor position 
    if row<3
        front_pos = pos+4;
    else 
        front_pos = -1;
    end
    
    % get right position
    
    if col<3 
        right_pos = pos + 1;
    else 
        right_pos  = -1;
        
    end
    
    

% check if left_pos... right_pos are occupied

if (ismember(left_pos,obstacle))
    left_val =1;
else
    left_val = 0;
end

if (ismember(front_pos,obstacle))
    front_val = 1;
else
    front_val = 0; 
end


if (ismember(right_pos,obstacle))
    right_val = 1;
else
    right_val = 0; 
end


end % direction 0


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if dir==1
    
    % get left sensor position
     if row>0
        left_pos = pos - 4;
    else 
        left_pos = -1;
     end    
     
    % get front sensor position 
    if col>0
        front_pos = pos-1;
    else 
        front_pos = -1;
    end
    
    % get right position
    
    if row <3 
        right_pos = pos + 4;
    else 
        right_pos  = -1;
        
    end
    



% check if left_pos... right_pos are occupied

if (ismember(left_pos,obstacle))
    left_val =1;
else
    left_val = 0;
end

if (ismember(front_pos,obstacle))
    front_val = 1;
else
    front_val = 0; 
end


if (ismember(right_pos,obstacle))
    right_val = 1;
else
    right_val = 0; 
end
 
end % end direction 1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dir =2

if dir==2
    
    % get left sensor position
     if col<3
        left_pos = pos + 1;
    else 
        left_pos = -1;
     end    
     
    % get front sensor position 
    if row>0
        front_pos = pos-4;
    else 
        front_pos = -1;
    end
    
    % get right position
    
    if col>0
        right_pos = pos - 1;
    else 
        right_pos  = -1;
        
    end
    
    

% check if left_pos... right_pos are occupied

if (ismember(left_pos,obstacle))
    left_val =1;
else
    left_val = 0;
end

if (ismember(front_pos,obstacle))
    front_val = 1;
else
    front_val = 0; 
end


if (ismember(right_pos,obstacle))
    right_val = 1;
else
    right_val = 0; 
end

end % direction 2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if dir==3
    
    % get left sensor position
     if row<3
        left_pos = pos + 4;
    else 
        left_pos = -1;
     end    
     
    % get front sensor position 
    if col<3
        front_pos = pos+1;
    else 
        front_pos = -1;
    end
    
    % get right position
    
    if row>0 
        right_pos = pos - 4;
    else 
        right_pos  = -1;
        
    end
    



% check if left_pos... right_pos are occupied

if (ismember(left_pos,obstacle))
    left_val =1;
else
    left_val = 0;
end

if (ismember(front_pos,obstacle))
    front_val = 1;
else
    front_val = 0; 
end


if (ismember(right_pos,obstacle))
    right_val = 1;
else
    right_val = 0; 
end
 
end % end direction 1

%sensor_val = [left_pos front_pos right_pos left_val front_val right_val]
sensor_val = [left_val front_val right_val];
return