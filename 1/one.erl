-module(one).
-export([one/1]).

one(N) -> sum(unique(sum_multiples_of([3, 5], N-1))).

multiples_of(Factor, N) -> multiples_of(Factor, N, []).

multiples_of( _, 0, Acc) -> Acc;
multiples_of(Factor, N, Acc) when N rem Factor == 0 -> multiples_of(Factor, N - 1, [N | Acc]);
multiples_of(Factor, N, Acc) -> multiples_of(Factor, N - 1, Acc).


sum_multiples_of (List, N) -> sum_multiples_of(List, N, []).
sum_multiples_of([], _, Acc) -> Acc;
sum_multiples_of([H | Rest], N, Acc) -> sum_multiples_of(Rest, N, Acc ++ multiples_of(H, N)).

sum([])				-> 0;
sum( [H | T]) -> H + sum(T).

unique(List) -> sets:to_list(sets:from_list(List)).