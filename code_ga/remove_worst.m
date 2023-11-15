function population = remove_worst(population, fitness)
    %remove_worst - Remove the 2 worst individuals from the population
    %
    % Syntax: population = remove_worst(population, fitness)
    %
    % Based on the fitness of the individuals, the 2 worst individuals are
    % removed from the population.
    % sort the fitnesses index from worst to best
    [~, indexes] = sort(fitness, 'descend');

    % add all but the first 2 individuals to the new population
    population = population(indexes(3:end), :);

end
