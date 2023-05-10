defmodule SortedLists do

  def dedup([]), do: []
  def dedup([a , a | rest ]), do: dedup([a | rest])
  def dedup([ a | rest ]), do: [ a | dedup(rest) ]

  def merge([], []), do: []
  def merge(l1, []), do: l1
  def merge([], l2), do: l2
  def merge([ h1 | t1], [h2 | t2]) when h1 < h2, do: [ h1 | merge(t1, [ h2 | t2 ]) ]
  def merge([ h1 | t1], [h2 | t2]), do: [ h2 | merge([ h1 | t1 ], t2) ]
end

defmodule Isomorph do
  def isIsomorphic(l1, l2)  when length(l1) != length(l2), do: false
  def isIsomorphic(l1, l2), do: signature(l1) == signature(l2)

  def signature(list) do
    list |> Enum.reduce({ [], %{} }, &findIndexOfLetter/2) |> elem(0)
  end

  def findIndexOfLetter(letter, { result, map }) do
    if Map.has_key?(map, letter) do
      { [ map[letter] | result ],  map}
    else
      len = map |> map_size
      { [ len | result ], Map.put(map, letter, len)}
    end
  end
end
