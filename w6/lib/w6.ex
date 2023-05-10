defmodule W6 do

  def contains_sum(sum, list), do: contains_sum(sum, list, [])

  def contains_sum(0, _, result), do: Enum.reverse(result)
  def contains_sum(_, [], _), do: false

  def contains_sum(sum, [ h | t ], result) do
    contains_sum(sum, t, result) || contains_sum(sum - h, t, [ h | result ])
  end
end
