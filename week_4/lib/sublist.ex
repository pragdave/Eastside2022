defmodule Sublist do

  def is?([], _list), do: true 
  def is?(sub, list) when length(sub) > length(list), do: false
  def is?([h | rsub], [ h | rlist ]), do: is?(rsub, rlist)
  def is?(sub, [_|rest]), do: is?(sub, rest)

  
end
