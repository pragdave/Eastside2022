defmodule Anagram do
  import String
  import Enum

  def sig(word) do 
    word 
    |> codepoints 
    |> sort 
    |> join 
  end

  def anagrams(words) do 
    words
    |> reduce(
      %{}, 
      fn (word, acc) -> 
        Map.update(acc, sig(word), [word], &[word | &1] ) 
      end)
  end

end

# anagrams |> Map.values |> Enum.map(fn list -> { length(list), list } end) |> Enum.max_by(fn {a,b} -> a end)

