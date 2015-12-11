(*Closed-open range from a to b, e.g. range 1 5 = [1;2;3;4] *)
let rec range a b =
	if a=b-1 then
		[a]
	else
		a::(range (a+1) b)