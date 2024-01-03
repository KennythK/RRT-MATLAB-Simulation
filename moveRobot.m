function moveRobot()
    result = robot_sim_server("status");
    pos = result(1);
    dir = result(2);
   
    %now, the robot will sense if there is any object above
    data = robot_sim_server("sensor_read");
    left  = data(1);
    front = data(2);
    right = data(3);
    

if dir == 0
    switch(pos)
        case 0
            if(data(2)== 0 && data(1) == 0 && data(3) == 0)
                result = robot_sim_server("move 1");
            elseif(data(2)== 1 && data(1) == 0 && data(3) == 0)
                result = robot_sim_server("move 2");
            end
        case 1
            if(data(2)== 0 && data(1) == 0 && data(3) == 0)
                result = robot_sim_server("move 1");
            elseif(data(2)== 1 && data(1) == 1 && data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(2)== 1 && data(1) == 0 && data(3) == 1)
                result = robot_sim_server("move 0");
            elseif(data(2)== 1 && data(1) == 1 && data(3) == 1)
                result = robot_sim_server("move 2");
            end
        case 2
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 3
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 4
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(2) == 1 && data(3) == 0)
                result = robot_sim_server("move 2");
            end
        case 5
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 6
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 7
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 8
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(2) == 1 && data(3) == 0)
                result = robot_sim_server("move 2");
            end
        case 9
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 10
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 11
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 12
            result = robot_sim_server("move 2");
        case 13
            if(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            elseif ((data(3) == 1) && (data(1) == 1))
                 result = robot_sim_server("move 2"); 
                 result = robot_sim_server("move 2"); 
            end
        case 14
            if(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            elseif ((data(3) == 1) && (data(1) == 1))
                 result = robot_sim_server("move 2"); 
                 result = robot_sim_server("move 2");                 
            end
        case 15
                result = robot_sim_server("move 0");
    end
    %DIR 1*********************************************************
elseif dir == 1
    switch(pos)
        case 0
            result = robot_sim_server("move 2");
        case 1
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            end
        case 2
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            end
        case 3
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            end
        case 4
            if(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            elseif ((data(3) == 1) && (data(1) == 1))
                 result = robot_sim_server("move 2"); 
                 result = robot_sim_server("move 2"); 
            end
        case 5
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 6
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 7
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 8
            if(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            elseif ((data(3) == 1) && (data(1) == 1))
                 result = robot_sim_server("move 2"); 
                 result = robot_sim_server("move 2"); 
            end
        case 9
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 10
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 11
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 12
            result = robot_sim_server("move 0");
        case 13
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 14
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 15
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
    end
    %DIR 2**************************************************************
 elseif dir == 2
    switch (pos)
        case 0
            result = robot_sim_server("move 0");
        case 1
            if(data(1) == 0)
                result = robot_sim_server("move 0");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
              elseif ((data(3) == 1) && (data(1) == 1))
                 result = robot_sim_server("move 2"); 
                 result = robot_sim_server("move 2"); 
            end
        case 2
            if(data(1) == 0)
                result = robot_sim_server("move 0");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif ((data(3) == 1) && (data(1) == 1))
                 result = robot_sim_server("move 2"); 
                 result = robot_sim_server("move 2"); 
            end
        case 3
                result = robot_sim_server("move 2");
        case 4
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(2) == 1 && data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 5
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 6
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 7
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(2) == 1 && data(3) == 0)
                result = robot_sim_server("move 2");
            end
        case 8
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(2) == 1 && data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 9
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 10
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 11
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(2) == 1 && data(3) == 0)
                result = robot_sim_server("move 2");
            end
        case 12
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 13
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 14
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 15
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            end
    end
           
%direction 3****************************************************
           
elseif dir == 3
    switch (pos)
        case 0
            if(data(2) == 0)
                result = robot_sim_server("move 1");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 1
            if(data(2) == 0)
                result = robot_sim_server("move 1");
            else
                result = robot_sim_server("move 0");
            end
        case 2
            if(data(2) == 0)
                result = robot_sim_server("move 1");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 3
                result = robot_sim_server("move 0");
        case 4
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 5
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 6
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 7
            if(data(1) == 0)
                result = robot_sim_server("move 0");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif ((data(3) == 1) && (data(1) == 1))
                 result = robot_sim_server("move 2"); 
                 result = robot_sim_server("move 2"); 
            end
        case 8
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 9
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 10
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif(data(1) == 0)
                result = robot_sim_server("move 0");
            end
        case 11
            if(data(1) == 0)
                result = robot_sim_server("move 0");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            elseif (data(3) == 1 && (data(1) == 1))
                 result = robot_sim_server("move 2"); 
                 result = robot_sim_server("move 2"); 
            end
        case 12
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            end
        case 13
            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            end
        case 14

            if(data(2)== 0)
                result = robot_sim_server("move 1");
            elseif(data(3) == 0)
                result = robot_sim_server("move 2");
            end
        case 15
                result = robot_sim_server("move 2");
        end
    end
end