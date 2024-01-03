
function robot_pose = move(pos,dir,command) 

row = floor(pos/4);
col = mod(pos,4);

switch command
 
    case 0 % command turn left 
        
            dir = dir + 1;
            
            if (dir ==4)
                dir = 0; 
            end 
            
    case 1  % move 1 grid 
        
           switch dir 
               case 0
                   if row < 3
                      pos = pos + 4;
                   else
                      pos = pos; 
                   end 
                   
               case 1
                if col>0 
                   pos = pos - 1;
                else
                   pos = pos;
                end 
                
               case 2
                   if row > 0 
                     pos = pos - 4;
                   else
                       pos=pos;
                   end 
                   
               case 3
                   if col<3
                      pos = pos+1;
                   else
                       pos=pos
                   end 
                   
           end 
                           
    case 2 % turn right 
            dir = dir-1;
            
            if (dir == -1)
                dir = 3;
            end 
                
end 

robot_pose = [pos dir];
return 