function uTurn()
    result = robot_sim_server("status");
    pos = result(1);
    dir = result(2);
   
    %now, the robot will sense if there is any object above
    data = robot_sim_server("sensor_read");
    left  = data(1);
    front = data(2);
    right = data(3);
    
    result = robot_sim_server("move 2");
    result = robot_sim_server("move 2");
    result = robot_sim_server("move 1");
end