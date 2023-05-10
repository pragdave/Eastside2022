defmodule W6Test do
  use ExUnit.Case
  doctest W6

  test "greets the world" do
    assert W6.hello() == :world
  end
end
