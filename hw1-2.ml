(* Question 1 *)
(* TODO: Write your own tests for the fact function.
         See the provided tests for double, above, for how to write test cases.
         Remember that you should NOT test cases for n < 0.
*)
(* TODO: Correct these tests for the fact function. *)
let fact_tests = [
  (0, 1.);
  (1, 1.);
  (2, 2.);
  (3,6.);
  (4,24.);
  (5,120.);
]

(* TODO: Correct this implementation so that it compiles and returns
         the correct answers.
*)
let rec fact (n: int): float =
  match n with
  | 0 -> 1.
  | _ -> float n *. fact (n - 1)


(* TODO: Write your own tests for the binomial function.
         See the provided tests for fact, above, for how to write test cases.
         Remember that we assume that  n >= k >= 0; you should not write test cases where this assumption is violated.
*)
let binomial_tests = [
  (* Your test cases go here. Correct the incorrect test cases for the function. *)
  ((0, 0), 1.);
  ((1, 0), 1.);
  ((2, 0), 1.); 
  ((10, 1), 10.);
  ((10,2),45.);
]

(* TODO: Correct this implementation so that it compiles and returns
         the correct answers.
*)
let binomial (n: int) (k: int) =
  if k>n  || k<0 
  then domain()
  else let rec aux x acc=
         if x>k then acc
         else aux(x+1)(acc *. float (n-x+1) /. float x) in
    aux 1 1.
    


(* TODO: Write a good set of tests for ackerman. *)
let ackerman_tests = [
  (* Your test cases go here *)
  ((0,0),1);
  ((0,1),2);
  ((1,0),2);
  ((1,1),3);
  ((2,1),5);
  ((3,0),5);
  ((3,1),13);
]

(* TODO: Correct this implementation so that it compiles and returns
         the correct answers.
*)
let ackerman (n, k)  =
  if n < 0 || k < 0
  then 0
  else (let rec ack n k =
          match (n, k) with
          | (0, k) -> k + 1
          | (n, 0) -> ack (n - 1) 1
          | (n, k) -> ack (n - 1) (ack n (k - 1))
        in ack n k)
       


(* Question 2: is_prime *)

(* TODO: Write a good set of tests for is_prime. *)
let is_prime_tests = [
(* Your tests go here *)
  (2,true);
  (3,true);
  (4,false);
  (29,true);
  (12,false);
  (51,false);

]

(* TODO: Correct this implementation so that it compiles and returns
         the correct answers.
*)
let is_prime n =
  if n<=1 then domain ()
  else 
    let rec helper_prime i=
      if i*i>n then true
      else if n mod i = 0 then false
      else helper_prime (i+1)
    in helper_prime 2
         

(* Question 3: Newton-Raphson method for computing the square root
*)

let square_root_tests = [
  (1.,1.);
  (4.,2.);
  (9.,3.);
  (25.,5.);
  (36.,6.)
]

let square_root a =
  if a<0. then domain()
  else
    let rec root x = 
      if epsilon_float *. a > abs_float(x *. x-. a) 
      then x
      else root((a /. x +.x)/.2.)
    in root 1.
  


(* Question 4: Fibonacci*)

(* TODO: Write a good set of tests for fib_tl. *)
let fib_tl_tests = [
  (0,1);
  (1,1);
  (2,2);
  (3,3);
  (4,5);
  (5,8);
  (6,13);
  
]

(* TODO: Implement a tail-recursive helper fib_aux. *)
let rec fib_aux n a b =
  if n =0 then a
  else fib_aux (n-1)b(a+ b)

(* TODO: Implement fib_tl using fib_aux. *)
let fib_tl n =
  if n <0 then domain ()
  else fib_aux n 1 1