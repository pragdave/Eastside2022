defmodule Week6 do

  def contains_sum(sum, list), do: contains_sum(sum, list, [])

  def contains_sum(0, _, tally), do: tally
  def contains_sum(_sum, [], _), do: false
  def contains_sum(sum, [ h  | t ], tally) do
    contains_sum(sum, t) || contains_sum(sum - h, t, [ h | tally ])
  end

end
