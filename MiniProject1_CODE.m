%EEL4930 Autonomous Robot
%Summer 2022
%Authors: Alejandro Rodriguez, Kennyth Kouch
%Mini Project 1 Completed

clc; clear
figure
obj_pos = [];
    edgeArray = [12, 13, 14, 15; 0, 4, 8, 12; 0, 1, 2, 3; 3, 7, 11, 15;];
    counter = 0;
    List = [];
clear robot_sim_server;   % reset simulation
while length(obj_pos) < 4
    %first, we will localize the robot
    result = robot_sim_server("status");
    pos = result(1);
    dir = result(2);
    num_moves = result(3);
    robot_plot(pos, dir, obj_pos);
    pause
   
    %now, the robot will sense if there is any object above
    data = robot_sim_server("sensor_read");
    left  = data(1);
    front = data(2);
    right = data(3);
        
%************************************************************************
    %Plan the next move
    %Object Detection
    if (dir == 0)   
        if (left == 1)
            if ismember(pos-1, obj_pos) == 0
            obj_pos = [obj_pos pos-1];
            List = [List obj_pos];
            end
        end
        if (front == 1)
            if ismember(pos+4, obj_pos) == 0
                obj_pos = [obj_pos pos+4];
                List = [List obj_pos];
            end
        end
        if (right == 1)
            if ismember(pos+1, obj_pos) == 0
                obj_pos = [obj_pos pos+1];
                List = [List obj_pos];
            end
        end 
     %end of direction 0
    elseif  (dir == 1)
                if (left == 1)
            if ismember(pos-4, obj_pos) == 0
            obj_pos = [obj_pos pos-4];
            List = [List obj_pos];
            end
        end
        if (front == 1)
            if ismember(pos-1, obj_pos) == 0
                obj_pos = [obj_pos pos-1];
                List = [List obj_pos];
            end
        end
        if (right == 1)
            if ismember(pos+4, obj_pos) == 0
                obj_pos = [obj_pos pos+4];
                List = [List obj_pos];
            end
        end
        %end of dir 1
    elseif (dir == 2)
                if (left == 1)
            if ismember(pos+1, obj_pos) == 0
            obj_pos = [obj_pos pos+1];
            List = [List obj_pos];
            end
        end
        if (front == 1)
            if ismember(pos-4, obj_pos) == 0
                obj_pos = [obj_pos pos-4];
                List = [List obj_pos];
            end
        end
        if (right == 1)
            if ismember(pos-1, obj_pos) == 0
                obj_pos = [obj_pos pos-1];
                List = [List obj_pos];
            end
        end
        %end of dir 2
    elseif (dir == 3)
        if (left == 1)
            if ismember(pos+4, obj_pos) == 0
            obj_pos = [obj_pos pos+4];
            List = [List obj_pos];
            end
        end
        if (front == 1)
            if ismember(pos+1, obj_pos) == 0
                obj_pos = [obj_pos pos+1];
                List = [List obj_pos];
            end
        end
        if (right == 1)
            if ismember(pos-4, obj_pos) == 0
                obj_pos = [obj_pos pos-4];
                List = [List obj_pos];
            end
        end
        %end of dir 3
    end 
    % end of Planning

%***********************************************************************
% MOVEMENT EXECUTION
% Closed List

    List = [List pos];
    closedLeft = false;
    closedRight = false;
    closedFront = false;
    closed = 0;
    lengthList = length(List) - 1
    for i = 1:lengthList
        if(dir == 0)
            if(pos-1 == List(i)) 
                closedLeft = true;
            end
            if(pos+1 == List(i)) 
                closedRight = true;
            end
            if(pos+4 == List(i)) 
                closedFront = true;
            end
        elseif(dir == 1)
            if(pos-4 == List(i)) 
                closedLeft = true;
            end
            if(pos+4 == List(i)) 
                closedRight = true;
            end
            if(pos-1 == List(i)) 
                closedFront = true;
            end
        elseif(dir == 2)
            if(pos+1 == List(i)) 
                closedLeft = true;
            end
            if(pos-1 == List(i)) 
                closedRight = true;
            end
            if(pos-4 == List(i)) 
                closedFront = true;
            end
        elseif(dir == 3)
            if(pos+4 == List(i)) 
                closedLeft = true;
            end
            if(pos-4 == List(i)) 
                closedRight = true;
            end
            if(pos+1 == List(i)) 
                closedFront = true;
            end
        end
    end
    
    onEdge = false;
    for i = 1:4
        if (dir == 0 && pos == edgeArray(1,i))
            onEdge = true;
        elseif (dir == 1 && pos == edgeArray(2,i))
            onEdge = true;
        elseif (dir == 2 && pos == edgeArray(3,i))
            onEdge = true;
        elseif (dir == 3 && pos == edgeArray(4,i))
            onEdge = true;
        end
    end
       
    counter = counter + 1;
    if counter > 15
        counter = 0;
        onEdge = false;
        List = [obj_pos];
    end
    if(dir == 0 && pos == 12)
        if(data(3) == 0)
            result = robot_sim_server("move 2");
        else
            uTurn();
            result = robot_sim_server("move 0");
        end
    elseif(dir == 0 && pos == 15)
        if(data(1) == 0)
            result = robot_sim_server("move 0");
        else
            uTurn();
            result = robot_sim_server("move 2");
        end
    elseif(dir == 1 && pos == 0)
        if(data(3) == 0)
            result = robot_sim_server("move 2");
        else
            uTurn();
            result = robot_sim_server("move 0");
        end
    elseif(dir == 1 && pos == 12)
        if(data(1) == 0)
            result = robot_sim_server("move 0");
        else
            uTurn();
            result = robot_sim_server("move 2");
        end
    elseif(dir == 2 && pos == 0)
        if(data(1) == 0)
            result = robot_sim_server("move 0");
        else
            uTurn();
            result = robot_sim_server("move 2");
        end
    elseif(dir == 2 && pos == 3)
        if(data(3) == 0)
            result = robot_sim_server("move 2");
        else
            uTurn();
            result = robot_sim_server("move 0");
        end
    elseif(dir == 3 && pos == 3)
        if(data(1) == 0)
            result = robot_sim_server("move 0");
        else
            uTurn();
            result = robot_sim_server("move 2");
        end
    elseif(dir == 3 && pos == 15)
        if(data(3) == 0)
            result = robot_sim_server("move 2");
        else
            uTurn();
            result = robot_sim_server("move 0");
        end
        
    elseif (~closedFront && ~onEdge)
        result = robot_sim_server("move 1");
    elseif(closedRight || ~closedLeft)
        result = robot_sim_server("move 0");
    elseif(closedLeft || ~closedRight)
        result = robot_sim_server("move 2");
    else
        uTurn();
    end
end
%end of the while

    for i=1:4
        switch(obj_pos(i))
            case 0
                objGrid(1,i,:) = [1 1];
            case 1
                objGrid(1,i,:) = [2 1];
            case 2
                objGrid(1,i,:) = [3 1];
            case 3
                objGrid(1,i,:) = [4 1];
            case 4
                objGrid(1,i,:) = [1 2];
            case 5
                objGrid(1,i,:) = [2 2];
            case 6
                objGrid(1,i,:) = [3 2];
            case 7
                objGrid(1,i,:) = [4 2];
            case 8
                objGrid(1,i,:) = [1 3];
            case 9
                objGrid(1,i,:) = [2 3];
            case 10
                objGrid(1,i,:) = [3 3];
            case 11
                objGrid(1,i,:) = [4 3];
            case 12
                objGrid(1,i,:) = [1 4];
            case 13
                objGrid(1,i,:) = [2 4];
            case 14
                objGrid(1,i,:) = [3 4];
            case 15
                objGrid(1,i,:) = [4 4];
        end
    end
    
    x1 = objGrid(1,1,1);
    y1 = objGrid(1,1,2);
    x2 = objGrid(1,2,1);
    y2 = objGrid(1,2,2);
    x3 = objGrid(1,3,1);
    y3 = objGrid(1,3,2);
    x4 = objGrid(1,4,1);
    y4 = objGrid(1,4,2);
    
    %Calculate Distance of the 4 Obstacles
    Obj_SOD = [0 0 0 0];
    Obj_SOD(1) = distance(x1, y1, x2, y2) + distance(x1, y1, x3, y3) + distance(x1, y1, x4, y4);
    Obj_SOD(2) = distance(x2, y2, x1, y1) + distance(x2, y2, x3, y3) + distance(x2, y2, x4, y4);
    Obj_SOD(3) = distance(x3, y3, x1, y1) + distance(x3, y3, x2, y2) + distance(x3, y3, x4, y4);
    Obj_SOD(4) = distance(x4, y4, x1, y1) + distance(x4, y4, x2, y2) + distance(x4, y4, x3, y3);
    
    maxDist = 0;
    for i = 1:4
        if Obj_SOD(i) > maxDist
            maxDist = Obj_SOD(i);
            furthestObj = obj_pos(i);
        end
    end

   
pushFlag = 0;
objGrid(:,:,2) = [0 0 0 0];
List = [obj_pos];
counter = 0;
while(pushFlag == 0)
    
    foundObj = 0;
    while(foundObj == 0)
    result = robot_sim_server("status");
    pos = result(1);
    dir = result(2);
    num_moves = result(3);
    robot_plot(pos, dir, obj_pos);
    pause
   
    %now, the robot will sense if there is any object above
    data = robot_sim_server("sensor_read");
    left  = data(1);
    front = data(2);
    right = data(3);
        if (dir == 0)
            if(pos + 4 == furthestObj)
                foundObj = 1;
                break;
            elseif(pos - 1 == furthestObj && pos ~=4 && pos ~=8 && pos ~=12)
                result = robot_sim_server("move 0");
                break;
            elseif(pos + 1 == furthestObj && pos ~=3 && pos ~=7 && pos ~=11)
                result = robot_sim_server("move 2");
                break;
            end
        elseif (dir == 1) 
            if(pos - 1 == furthestObj && pos~=4 && pos~=8 && pos~=12)
                foundObj = 1;
                break;
            elseif(pos - 4 == furthestObj)
                result = robot_sim_server("move 0");
                break;
            elseif(pos + 4 == furthestObj)
                result = robot_sim_server("move 2");
                break;
            end
        elseif (dir == 2) 
            if(pos - 4 == furthestObj)
                foundObj = 1;
                break;
            elseif(pos + 1 == furthestObj && pos ~=3 && pos ~=7 && pos ~=11)
                result = robot_sim_server("move 0");
                break;
            elseif(pos - 1 == furthestObj && pos ~=4 && pos ~=8 && pos ~=12)
                result = robot_sim_server("move 2");
                break;
            end
        elseif (dir == 3 && (pos + 1 == furthestObj) && pos~=3 && pos~=7 && pos~=11) 
            if(pos + 1 == furthestObj)
                foundObj = 1;
                break;
            elseif(pos + 4 == furthestObj)
                result = robot_sim_server("move 0");
                break;
            elseif(pos - 4 == furthestObj)
                result = robot_sim_server("move 2");
                break;
            end
        end
   
    %Navigate Until Find the most distant obstacle
    List = [List pos];
    closedLeft = false;
    closedRight = false;
    closedFront = false;
    closed = 0;
    for i = 1:length(List)
        if(dir == 0)
            if(pos-1 == List(i)) 
                closedLeft = true;
            end
            if(pos+1 == List(i)) 
                closedRight = true;
            end
            if(pos+4 == List(i)) 
                closedFront = true;
            end
        elseif(dir == 1)
            if(pos-4 == List(i)) 
                closedLeft = true;
            end
            if(pos+4 == List(i)) 
                closedRight = true;
            end
            if(pos-1 == List(i)) 
                closedFront = true;
            end
        elseif(dir == 2)
            if(pos+1 == List(i)) 
                closedLeft = true;
            end
            if(pos-1 == List(i)) 
                closedRight = true;
            end
            if(pos-4 == List(i)) 
                closedFront = true;
            end
        elseif(dir == 3)
            if(pos+4 == List(i)) 
                closedLeft = true;
            end
            if(pos-4 == List(i)) 
                closedRight = true;
            end
            if(pos+1 == List(i)) 
                closedFront = true;
            end
        end
    end
    
    onEdge = false;
    for i = 1:4
        if (dir == 0 && pos == edgeArray(1,i))
            onEdge = true;
        elseif (dir == 1 && pos == edgeArray(2,i))
            onEdge = true;
        elseif (dir == 2 && pos == edgeArray(3,i))
            onEdge = true;
        elseif (dir == 3 && pos == edgeArray(4,i))
            onEdge = true;
        end
    end
       
    counter = counter + 1;
    if counter > 8
        counter = 0;
        onEdge = false;
        List = [obj_pos];
    end

        if(dir == 0 && pos == 12)
            if(data(3) == 0)
                result = robot_sim_server("move 2");
            else
                uTurn();
                result = robot_sim_server("move 0");
            end
        elseif(dir == 0 && pos == 15)
            if(data(1) == 0)
                result = robot_sim_server("move 0");
            else
                uTurn();
                result = robot_sim_server("move 2");
            end
        elseif(dir == 1 && pos == 0)
            if(data(3) == 0)
                result = robot_sim_server("move 2");
            else
                uTurn();
                result = robot_sim_server("move 0");
            end
        elseif(dir == 1 && pos == 12)
            if(data(1) == 0)
                result = robot_sim_server("move 0");
            else
                uTurn();
                result = robot_sim_server("move 2");
            end
        elseif(dir == 2 && pos == 0)
            if(data(1) == 0)
                result = robot_sim_server("move 0");
            else
                uTurn();
                result = robot_sim_server("move 2");
            end
        elseif(dir == 2 && pos == 3)
            if(data(3) == 0)
                result = robot_sim_server("move 2");
            else
                uTurn();
                result = robot_sim_server("move 0");
            end
        elseif(dir == 3 && pos == 3)
            if(data(1) == 0)
                result = robot_sim_server("move 0");
            else
                uTurn();
                result = robot_sim_server("move 2");
            end
        elseif(dir == 3 && pos == 15)
            if(data(3) == 0)
                result = robot_sim_server("move 2");
            else
                uTurn();
                result = robot_sim_server("move 0");
            end
        elseif (~closedFront && ~onEdge)
            result = robot_sim_server("move 1");
        elseif(closedFront && ~onEdge)
            result = robot_sim_server("move 0");
        elseif(closedRight)
            result = robot_sim_server("move 0");
        elseif(closedLeft)
            result = robot_sim_server("move 2");
        else
            uTurn();
        end
    end
    
 %*************************************************************************
 %Push Object 
    pushFlag = 0;
    inc = [4 -1 -4 1];
    
    while(pushFlag == 0)
            result = robot_sim_server("status");
    pos = result(1);
    dir = result(2);
        result = robot_sim_server("move 1");

        if ismember(pos, edgeArray(dir + 1, :))
                pushFlag = 1;

        end

        topObj = false;
        leftObj = false;
        bottomObj = false;
        rightObj = false;
        for i = 1:4
            if (furthestObj == edgeArray(2,i))
                onEdge = true;
            elseif (furthestObj == edgeArray(4,i))
                onEdge = true;
            end
        end
        
        for i = 1:length(obj_pos)
            if(furthestObj == obj_pos(i)  && (dir == 1 || dir == 3) && onEdge)
                furthestObj = furthestObj - 16;
                obj_pos(i) = furthestObj;
            elseif (furthestObj == obj_pos(i))
                furthestObj = furthestObj + inc(dir + 1);
                obj_pos(i) = furthestObj;
            end
        end

        robot_plot(pos, dir, obj_pos);
        pause;

        for i = 1: length(obj_pos)
            if furthestObj == obj_pos(i)
                obj_pos(i) = [];
              
                break;
            end
        end
        robot_plot(pos, dir, obj_pos);
    end
end
%END OF THE PROJECT
%**************************************************************************
    