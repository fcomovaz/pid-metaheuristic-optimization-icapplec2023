function population = create_population(individuals)
%create_population - Create a population of random gains for PID controller
%
% Syntax: population = create_population(individuals)
%
% This function returns an array of kp, ki and kd gains for a PID
% generated randomly.
    population = zeros(individuals, 3);

    % create random individuals from 0 to 100
    for i = 1:individuals
        % population(i, :) = rand(1, 3);
        % generate random integers
        population(i, :) = randi([0 10], 1, 3);
    end
    
end