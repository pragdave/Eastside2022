defmodule WordFinder.ExtractWords do

  @type trigram :: nonempty_list(String.t)
  @type t :: Map.t(String.t, String.t)

  @spec asTrigramMap(String.t) :: t
  def asTrigramMap(string) do
    string
    |> tokenize
    |> toTrigrams
    |> buildDictionary
  end

  @spec tokenize(String.t) :: list(String.t)
  def tokenize(string) do
    string
    |> String.downcase()
    |> String.replace(~r/'d/, "ed")
    |> String.replace(~r/[^a-z ]/, " ")
    |> String.split()
  end

  @spec toTrigrams(list(String.t)) :: list(trigram())
  def toTrigrams(words) do
    words
    |> Stream.chunk_every(3, 1, :discard)
  end

  @spec buildDictionary(trigram) :: t
  def buildDictionary(trigrams) do
    trigrams
    |> Enum.reduce(Map.new, &addTrigramToDictionary/2)
  end

  defp addTrigramToDictionary([ w1, w2, w3 ], dictionary) do
    dictionary
    |> Map.update([ w1, w2 ], [ w3 ], &[ w3 | &1 ])
  end
end
