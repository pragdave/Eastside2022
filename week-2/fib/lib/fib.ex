defmodule MyList do

  def is_even_length?([]), do: true
  def is_even_length?([ _h1, _h2 | tail ]), do: is_even_length?(tail)
  def is_even_length?([_x]), do: false
end
