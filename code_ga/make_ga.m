function ga_result = make_ga(transfer_function, time, pop_size, max_gen, mutation_rate, verbose)
    pkg load control;
    % make_ga -  Creates a genetic algorithm to find the best gains for a PID
    %
    % Syntax: ga_result = make_ga(transfer_function, time, pop_size, max_gen, mutation_rate, verbose=0)
    %
    % Inputs:
    % Transfer function is the transfer function of the system
    % Time is the time vector of the system
    % Pop_size is the size of the population
    % Max_gen is the maximum number of generations
    % Mutation_rate is the rate of mutation
    % Verbose is a boolean to print the results
    %
    % Output:
    % Ga_result is a struct with the following fields:
    %   - best_fitnesses: The best fitness of the generation
    %   - best_individual: The best individual of the population
    %   - best_individuals: The best individuals of each generation

    % ===================== INITIALIZATION =====================
    % Create the population
    population = create_population(pop_size);
    % all the 3rd column is 0
    % population(:, 2) = 0;

    % preallocate best fitness and fitnesses
    best_fitnesses = zeros(max_gen, 1);
    fitness = zeros(pop_size, 1);

    % ===================== MAIN LOOP =====================
    for gen = 1:max_gen

        if verbose == 1
            printf("\rGeneration %d/%d", gen, max_gen);
        end

        for i = 1:pop_size
            fitness(i) = calculate_fitness(transfer_function, population(i, :), time);
        end

        best_fitnesses(gen) = min(fitness);
        parents = select_parents(population, fitness);
        children = make_crossover(parents);
        children = make_mutation(children, mutation_rate);
        n_population = remove_worst(population, fitness);
        population = [n_population; children];

    end

    % ===================== RESULTS =====================
    % best gains
    best_gains = get_best_individual(population, fitness);
    % pid controller
    pid_controller = pid(best_gains(1), best_gains(2), best_gains(3));
    % best fitness (min fitness)
    best_fitness = min(best_fitnesses);
    % tf controlled
    tf_controlled = feedback(pid_controller * transfer_function, 1);

    ga_result = struct('BestGains', best_gains, 'AllFitnesses', ...
        best_fitnesses, 'BestFitness', best_fitness, 'PIDController', ...
        pid_controller, 'ControlledTF', tf_controlled);

end
