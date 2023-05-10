defmodule Week4 do

  def gcd(a, a), do: a
  def gcd(a, b) when a > b, do: gcd(a-b,b)
  def gcd(a, b), do: gcd(a, b-a)


  # def countVal(a, []), do: 0
  # def countVal(a, [a]), do: 1
  # def countVal(a, [a|t]), do: 1 + countVal(a, t)
  # def countVal(a, [b|t]), do: countVal(a, t)


  def isSub([], _), do: true
  def isSub(_, []), do: false
  # def isSub(a,a), do: true
  def isSub([a | t1], [a | t2]), do: isSub(t1, t2)
  def isSub(a, [_ | t]), do: isSub(a, t)

end
