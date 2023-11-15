function mutated = make_mutation(children, mutation_rate)
    %make_mutation - Make a simple mutation between two children
    %
    % Syntax: children = make_mutation(children)
    %
    % Combine two children to make two mutations
    child_1 = children(1, :);
    child_2 = children(2, :);
    mutated = zeros(2, length(child_1));

    % get the probability of mutation
    probability = rand(1, 1);

    % Generate random value in between -1 and 1
    mutation_amount = (2 * rand(1, 1) - 1);
    scale_rate = 0.1;

    % make the mutation
    if probability < mutation_rate
        child_1 = child_1 * (1 + scale_rate * (2 * rand(1, 1) - 1));
        child_2 = child_2 * (1 + scale_rate * (2 * rand(1, 1) - 1));
    end

    % use the childs to make the mutation
    mutated(1, :) = child_1;
    mutated(2, :) = child_2;

end
