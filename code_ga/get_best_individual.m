function best = get_best_individual(population, fitness)
    %get_best_individual - Get the parents of the next generation
    %
    % Syntax: best = get_best_individual(population, fitness, num_parents)
    %
    % Get the num_parents best individuals from the population and add them to
    % the parents array.

    % get the indexes of the num_parents best individuals
    [~, indexes] = sort(fitness, 'ascend');

    % get the best individual
    best = population(indexes(1), :);
end
