function mse = calculate_fitness(transfer_function, gains, time)
    pkg load control;
    pkg load image;
    %calculate_fitness - Returns the mse of a control system after a PID control is applied
    %
    % Syntax: mse = calculate_fitness(goal, transfer_function, gains)
    %
    % Goal is the desired output of the system
    % Time is the time of simulation
    % Transfer function is the transfer function of the system
    % Gains is the gains of the PID controller

    % unpack the gains
    kp = gains(1);
    ki = gains(2);
    kd = gains(3);

    % create the PID controller
    pid_control = pid(kp, ki, kd);

    % create the feedback loop
    tf_pid = feedback(pid_control * transfer_function, 1);

    % simulate the system
    y = step(tf_pid, time);

    % calculate the mse
    goal = ones(size(y));
    mse = immse(goal, y);

end
