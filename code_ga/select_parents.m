function parents = select_parents(population, fitness)
    %select_parents - Get the parents of the next generation
    %
    % Syntax: parents = select_parents(population, fitness)
    %
    % Get the 2 best individuals from the population and add them to
    % the parents array.

    % get the indexes of the 2 best individuals
    % the parents are a 1x3 array in a 5x3 matrix so i need to get the entire row
    [~, parents] = sort(fitness, 'ascend');
    parents = parents(1:2);

    % get the parents from the population
    parents = population(parents, :);

end
