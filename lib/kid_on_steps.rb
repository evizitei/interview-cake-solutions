def step_permutations(num_steps)
  if num_steps <= 1
    return 1
  elsif num_steps == 2
    return 2
  else
    return step_permutations(num_steps-1) +
           step_permutations(num_steps-2) +
           step_permutations(num_steps-3)
  end
end
