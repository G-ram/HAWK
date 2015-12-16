(*Closed-open range from a to b, e.g. range 1 5 = [1;2;3;4] *)
let rec range a b =
	if a=b-1 then
		[a]
	else
		a::(range (a+1) b)
		
let have_duplicates compare lst = 
	let sorted = List.sort compare lst in
	match sorted with 
		[] -> false
		| hd::tl -> fst (List.fold_left (fun (b,last) next -> (b || last=next),next) (false,hd) tl)
		
(*Are all the elements of a list the same? *)
let all_the_same = function
	| [] -> true
	| lst ->
		(let hd = (List.hd lst) in
		List.for_all ((=) hd) lst)