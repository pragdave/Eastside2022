def subsets_less_than(reference_value, array)
  array = array.sort {|a,b| a <=> b}
  previous_sums = []
  array.each do |element|
    new_sums = []
    new_sums << [element] if element <= reference_value
    previous_sums.each do |previous_sum|
      current_sum = previous_sum + [ element ]
      new_sums << current_sum if current_sum.inject(0){|accumulator,value|accumulator+value} <= reference_value
    end
    previous_sums = previous_sums + new_sums
  end
  previous_sums
end

def subsets_with_total(reference_value, array)
  subsets_less_than(reference_value, array)
  .inject([]) do |accumulator, subset|
    accumulator << subset if subset.sum == reference_value
    accumulator
  end
end

p subsets_with_total(10, [1, 2, 3, 4, 5])
