function num_obj = navigate()

near = robot_sim_server("sensor_read")
data = robot_sim_server("status")
pos = data(1);
dir = data(2);

row = floor(pos/4);
col = mod(pos,4);

persistent pre_pos;
persistent obj_count;
persistent obj_loc;
persistent pos_count;

if (isempty(pre_pos))
    pre_pos = 0;
    pos_count = 0;
end 
if (isempty(obj_loc))
    obj_loc = 0;
    obj_count = 0;
end 

robot_plot(pos, dir, obj_loc);





if(dir == 0)
    
        
    if(near(3) == 1 && ~ismember(pos+1, obj_loc))
        obj_count = obj_count + 1;
        obj_loc(obj_count) = pos + 1;
%         robot_sim_server("move 0");
%         return;
    elseif(near(1) == 1 && ~ismember(pos-1, obj_loc))
        obj_count = obj_count + 1;
        obj_loc(obj_count) = pos - 1;
%         robot_sim_server("move 0");
%         return;
    end
    if(near(2) == 1 && ~ismember(pos+4, obj_loc))

        obj_count = obj_count + 1;
        obj_loc(obj_count) = pos + 4;
        pre_pos(pos_count)= (pos);
        robot_sim_server("move 0");
        return;
    end
    if(pos == 8 && near(3) ~= 1)
        robot_sim_server("move 2");
        return;
    end
    if(pos == 14 && near(3) ~= 1)
        robot_sim_server("move 0");
        return;
    end
    if(pos == 13 && near(1) ~= 1)
        robot_sim_server("move 0");
        return;
    end
    if(col == 0 && row == 3)
        robot_sim_server("move 2");
        return;
    end
    if(col == 3 && row == 3)
        robot_sim_server("move 0");
        return;
    end
    if(near(2) == 1 && col == 4)
        robot_sim_server("move 0");
        return;
    elseif(near(2))
        robot_sim_server("move 2");
        return;
    elseif(pos == 8 && near(2) ~= 0)
        robot_sim_server("move 2");  
        return;
    end
    if(col == 0 && near(2) == 1)
         if(col == 0 || col == 1)
             robot_sim_server("move 2");
             return;
         else
             robot_sim_server("move 0");
             return;
         end
        
    end
%     if(near(2) == 0 && ~ismember(pos+4, pre_pos)) 
%          
%         pos_count = pos_count + 1;
%         pre_pos(pos_count) = (pos);
%         robot_sim_server("move 1");
%         return;
%     end  

    if(near(2) == 0)
        robot_sim_server("move 1");
        return;
  
    elseif(col == 0 || col == 1)
        robot_sim_server("move 0");
        return;
    else
        robot_sim_server("move 2");   
    end



        
elseif(dir == 1)
    if(near(1) == 1 && ~ismember(pos-4, obj_loc))
        obj_count = obj_count + 1; 
        obj_loc(obj_count) = pos - 4;         
        pre_pos(pos_count)= (pos);
        robot_sim_server("move 0");
        return;
    elseif(near(3) == 1 && ~ismember(pos+4, obj_loc))
        obj_count = obj_count + 1; 
        obj_loc(obj_count) = pos + 4;
        pos_count = pos_count + 1;
        robot_sim_server("move 0");
        return;
    end
    if(near(2) == 1 && ~ismember(pos-1, obj_loc))
        obj_count = obj_count + 1;
        obj_loc(obj_count) = pos - 1;
        
        pre_pos(pos_count)= (pos);
        robot_sim_server("move 0");
        return;
    end
    if(pos == 13 && near(1) ~= 1)
        robot_sim_server("move 0");
        return;
    end
    if(pos == 2 && near(1) ~= 1)
        robot_sim_server("move 2");
        return;
    elseif(pos == 3 && near(1) ~= 1)
        robot_sim_server("move 0");
        return;
    end
    if(col == 0 || near(2) == 1)
         if(row == 0 || row == 1)
            robot_sim_server("move 2");
             return;
         else
             robot_sim_server("move 0");
             return;
         end
        
    end
    if(near(2) == 0 && ~ismember(pos-1, pre_pos)) 
        
        pos_count = pos_count + 1;
        pre_pos(pos_count) = (pos);
        robot_sim_server("move 1");
        return;
    end   

    
    if(col == 0 && row == 0)
        robot_sim_server("move 2");
        return;
    elseif(near(2) == 0)
        robot_sim_server("move 1");
        return;
    else
        robot_sim_server("move 0");
    end  



elseif(dir == 2)
    if(near(1) == 1 && ~ismember(pos+1, obj_loc))
        obj_count = obj_count + 1;         
        obj_loc(obj_count) = pos + 1;
        robot_sim_server("move 0");
        return;
    elseif(near(3) == 1 && ~ismember(pos-1, obj_loc))
        obj_count = obj_count + 1;
        obj_loc(obj_count) = pos - 1; 
        robot_sim_server("move 0");
        return;
    end
    if(near(2) == 1 && ~ismember(pos-4, obj_loc))
        obj_count = obj_count + 1;
        obj_loc(obj_count) = pos - 4;
        
        pre_pos(pos_count)= (pos);
        robot_sim_server("move 0");
        return;
    end
    if(row == 0 || near(2) == 1)
         if(col == 0 || col == 1)
             obj_loc(obj_count) = pos - 4;
             pre_pos(pos_count)= (pos);
             robot_sim_server("move 0");
             return;
         else
             robot_sim_server("move 2");
             return;
         end
        
    end
    if(near(2) == 0 && ~ismember(pos-4, pre_pos)) 
        
        pos_count = pos_count + 1;
        pre_pos(pos_count) = (pos);
        robot_sim_server("move 1");
        return;
    end   

    if(near(2) == 0)
        robot_sim_server("move 1");
        return;
    else
        robot_sim_server("move 0");
        return;
    end




elseif(dir == 3)
    if(near(1) == 1 && ~ismember(pos+4, obj_loc))
        obj_count = obj_count + 1;         
        obj_loc(obj_count) = pos + 4;
        robot_sim_server("move 0");
        return;
    elseif(near(3) == 1 && ~ismember(pos-4, obj_loc))
        obj_count = obj_count + 1;
        obj_loc(obj_count) = pos - 4;  
        robot_sim_server("move 0");
        return;
    end
    if(near(2) == 1 && ~ismember(pos+1, obj_loc))
        obj_count = obj_count + 1;
        obj_loc(obj_count) = pos + 1;
        pre_pos(pos_count)= (pos);
        robot_sim_server("move 0");
        return;
    end
    if(pos == 2 && near(1) ~= 1)
        robot_sim_server("move 0");
    elseif(pos == 3 && near(1) ~= 1)
        robot_sim_server("move 0");        
    end
    if(col== 3 || near(2) == 1)
         if(row == 0 || row == 1)
             robot_sim_server("move 0");
             return;
         else
             robot_sim_server("move 2");
             return;
        end
        
    end
    if(near(2) == 0 && ~ismember(pos+1, pre_pos)) 
        
        pos_count = pos_count + 1;
        pre_pos(pos_count) = (pos);
        robot_sim_server("move 1");
        return;
    end   

    if(near(2) == 0)
        robot_sim_server("move 1");
        return;
    else
        robot_sim_server("move 0");
        return;
    end

% else
%     rand_move = randi(3)
%     if rand_move == 1
%         robot_sim_server("move 0");
%     elseif rand_move == 2
%         robot_sim_server("move 1");
%     elseif rand_move == 3
%     robot_sim_server("move 2");
%     end
% end

objs = obj_loc;
end
