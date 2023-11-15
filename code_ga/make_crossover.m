function children = make_crossover(parents)
    %make_crossover - Make a simple crossover between two parents
    %
    % Syntax: children = make_crossover(parents)
    %
    % Combine two parents to make two children
    parent_1 = parents(1, :);
    parent_2 = parents(2, :);

    % preallocate children
    children = zeros(2, length(parent_1));

    % make the children
    child_1 = [parent_1(1) parent_2(2) parent_1(3)];
    child_2 = [parent_2(1) parent_1(2) parent_2(3)];

    % use the childs to make the children
    children(1, :) = child_1;
    children(2, :) = child_2;

end
