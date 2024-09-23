# getting-started-with-OCaml
Introduction

Welcome to the Learn-OCaml automated grading platform! Your homeworks will be supplied on this website for the duration of this course. Please use a non-Chrome based browser to access this website (e.g. not using Edge, Chrome, etc.), otherwise your page might loading forever and have unexpected problems.

The questions you will be given in the assignments will generally consist of two parts: writing tests and writing code. For each problem to solve, you will first be asked to write up tests, written as a list of (input, output) pairs. That is, each element of the list has to be a pair, with the first element being a tuple of arguments for the function you want to test, and the second element the answer you expect the function to return on those arguments. You can see some examples of this in the code we have provided for you.

It is important that you design these tests before writing your code: the goal of these exercises is for you to think about the problem and design test cases that represent a sufficient range of possible inputs to thoroughly eliminate any bugs in your implementation. The grader will also tell you whether or not your test cases are correct, so you can use this to make sure that you understand what kind of values your function should return. Until you have written a sufficient set of test cases, we will not show you our own test cases that we are running on your code.

We will evaluate the test cases you create by running the given inputs on slightly incorrect versions of the function in question: we then expect that at least one of the (input, output) pairs you provide will not be matched by the buggy code. If the buggy version passes all of your tests (that is, given those inputs, the buggy version produces outputs identical to the ones given), your test list will be deemed insufficient to expose the bug. This is known in the software development industry as mutation testing.

Following the writing of tests, you will need to implement the function or behaviour in question. This is very straightforward coding. However, remember that you should not rely on your knowledge of other programming languages or paradigms, but instead use what you are taught in this course. For example, you should never be solving the question in a different language and then translating it to OCaml, and you should not be using programming constructs that have not been discussed in class.

The Learn-OCaml platform provides you with the following tools to help you out:

The Compile button runs syntax- and type-checking. If this returns errors, most other functionalities will not work for you. Use the red highlights of the line numbers to see where your errors are.
The Grade button evaluates your code against our tests and solutions, and returns a grade. Remember to run this at least once to get a grade! The Report tab then explains where you received — or failed to receive — your points.
The Toplevel tab allows you to interact with OCaml, providing you with a read-eval-print loop (REPL) system. Entering an expression in the bottom text box and pressing Enter will evaluate it. You may do line breaks by pressing Ctrl-Enter (Cmd-Enter on a Mac).
The Eval code button loads your code into the Toplevel, without you copying and pasting it into the text box. Convenience!
Question 1 : Fix Me

Three functions have been implemented incorrectly in the provided template code:

fact: int -> float: Given a number n≥0, return n!, that is, n⋅(n−1)⋅(n−2)⋅...⋅1. The result should be returned as a floating-point number.
binomial: int -> int -> float: Given a number n≥0 and a number n≥k≥0, the binomial coefficient, is defined as n!k!(n−k)!. The result should be returned as a floating-point number.
ackerman: int * int -> int: Given a number n≥0 and k>=0, the Ackerman function can be defined as follows:
A(0, k) = k + 1
A(n, 0) = A(n - 1, 1) for n >= 1
A(n, k) = A(n - 1, A(n, k - 1)) for n >= 1 and k >= 1
This definition of the Ackerman function is due to the mathematician Rózsa Péter given in her seminal work "Konstruktion nichtrekursiver Funktionen, Math. Annalen111 (1935), S. 42–60. "
First, write up some tests for these three functions. Write tests for the function fact in the list named fact_tests, the ones for binomial in binomial_tests, and the ones for ackerman in ackerman_tests respectively. Some example test cases are provided for the fact function, but they are incorrect; you should fix them.
Note: you should only write test cases for valid inputs, i.e. you should not write tests for negative numbers for this question.

Then, correct the various syntax, type and logical errors contained in both functions' implementations. Use the Compile button at the top-right to help yourself find syntax and type errors, then use the Grade button to analyze the logical errors.

Question 2 : Prime Number

Implement the function is_prime : int -> bool.

This can be done naively as follows: to test whether given n (where n > 1) is prime, we try to find a number that divides n by checking for each number x where x * x <= n whether it divides n. For inputs n <= 1, you should raise the exception Domain A given integer n may have many factors or very few. Note that 1 and n are always factors of n. In some cases (if n is prime) these are the only factors.

As above, first write tests (for n > 1) in the corresponding list, then implement the function.

Question 3 : Finding the root of the problem

Implement the function findroot using the Newton-Raphson method to complete square_root : float -> float.

The Newton-Raphson method can be used to find the roots of a function; in particular, it can be used for computing the square root of a given integer. Given a good initial approximation, it converges rapidly and is highly effective for computing square roots, solving the equation a−x2=0.

To compute the square root of a, choose a positive number, for example 1., as the first approximation. If x is the current approximation, then the next approximation x′ is:

x′=ax+x2

Stop as soon as the difference between x and x′ becomes too small.
Implement the function findroot x acc where x approximates the square root of a with accuracy acc. i.e. return x' when the absolute difference between x and x' is smaller than acc.

We use epsilon_float as the desired accuracy, which in OCaml is the difference between 1. and the smallest exactly representable floating-point number greater than 1..

Note that we made findroot a local function to be defined inside the function square_root.

Remark: You can compute the absolute value of a floating point number in Ocaml with the library function abs_float : float -> float.

Question 4 : Fibonacci Sequence

In this question we will implement the fib function tail recursively. Recall the Fibonacci sequence (indexed at 0):

1, 1, 2, 3, 5, 8, ..., fib(n−1)+fib(n−2)

First write a good set of test cases for fib_tl. Remember that you should only write tests for cases where n≥0.
Then, implement fib_tl by writing a tail-recursive helper function fib_aux: int -> int -> int -> int. Note that this helper function needs two accumulators.
