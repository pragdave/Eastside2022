defmodule WordFinder.Cli do

  alias WordFinder.ExtractWords

  @spec interact(String.t) :: list

  def interact(filename) do
    dictionary =
      filename
      |> File.read!
      |> ExtractWords.asTrigramMap

    story = [ getWord("First word"), getWord("Secord word") ] |> Enum.reverse()

    buildStory(dictionary, story)
  end

  def buildStory(dictionary, story = [ w2, w1 | _rest ]) do
    next = dictionary[[w1, w2]]
    case next do
      nil ->
        story |> Enum.reverse()
      [ word ] ->
        buildStory(dictionary, [ word | story ])
      list ->
        IO.puts([ "Possible words: ", list |> Enum.join(", ") ])
        buildStory(dictionary, [ getWord(storyFromList(story)) | story ])
    end
  end

  def getWord(prompt) do
    IO.gets([prompt, ": "])
    |> String.trim
    |> String.downcase
  end

  defp storyFromList(list) do
    list |> Enum.reverse |> Enum.join(" ")
  end
end
