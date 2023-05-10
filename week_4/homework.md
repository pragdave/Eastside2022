For each of these, sketch out the code that 
implements a solution using the ideas from the 
class so far.

If you want to check your answers, you can always 
run them through iex:

    iex> require filename.ex
    iex> YourModule.your_function(params,...)

For the following, do not use any functions from the built-in
Enum or List libraries.

1. Have a look at the definition of Euclid's algorithm for
   calculating the Greatest Common Denominator of two numbers
   (https://en.wikipedia.org/wiki/Greatest_common_divisor)

   Write a function that takes two integers and that returns
   their GCD using Euclids algorithm

2. Write a function that takes a value and a list, and that returns
   the number of times that value occurs in the list.

3. A is a sublist of B if all the values in A occur as adjacent values
   in B. So

       [ 1, 2, 3 ]  is a sublist of   [ 1, 2, 3 ]
                                      [ 1, 2, 3, 4 ]
                                      [ 0, 1, 2, 3, 4 ]
                                      [ 0, 1, 2, 1, 2, 3, 4 ]

                    but not of        [ 1, 2 ]
                                      [ 3, 2, 1 ]
                                      [ 0, 1, 2, 1, 3, 1 ]
   Write a function that takes two parameters and returns
   true or false depending on whether the first is a sublist of
   the second.

The following is a bonus question. You're allow to use any library modules
you choose (although you want want to look at Enum.reduce and Map in particular).
This is more difficult, and the solution might not feel as "clean" as
the solutions to the previous questions.

4. Two things are isomorphic if they have the same shape.

   We'll say that two lists are isomorphic if they are the same length and all
   repeated elements in one are repeated in the same positions in the other.

   For example the lists [1, 2, 1] and ["cat", "dog", "cat"] are isomorphic
   because the first element also occurs as the last element in each. The 
   lists [1, 2, 1] and ["cat", "cat", "cat"] are _not_ isomorphic, because the 
   repetition of "cat" in the second is different to the repetition of 1 in the first.

   Here are a few more sets of isomorphic lists

   [] and []
   [1,2,3] and ["a", "z", "wombat"] and [2,3,4]
   [1, 2, 2, 3, 3, 4] and [4, 3, 3, 2, 2, 1]

   Write a function that takes two lists are returns true if they
   are isomorphic, false otherwise.
