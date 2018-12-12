(*shift character certain amount*)
fun shiftChar(letter: char, shiftAmount : int) : char =
    let
	   val code = Char.ord letter;
	in
	   (*if it's a space, don't do anything -- otherwise shift the char*)
	   if code = 32 then Char.chr code
	   else chr (((code - 65 + shiftAmount) mod 26) + 65)
	end;
    
(*encrypt a string*)    
fun encrypt (str : string, shiftAmount : int) : string =
    (*map each character of a string to a new shifted character
    and put the string back together*)
    String.implode(map (fn x => shiftChar ((Char.toUpper x), shiftAmount)) (String.explode(str)));

(*decrypt a string*)
fun decrypt(str : string, shiftAmount : int) : string =
(*call encrypt with a negative shiftamount*)
    encrypt(str, (shiftAmount * ~1));
    
(*encrypt a string from maxshiftvalue to 0 using recursion*)
fun solve(str, maxShiftValue)  = (
    print((Int.toString maxShiftValue)^": " ^ encrypt(str, maxShiftValue)^"\n");
    if maxShiftValue > 1 then solve(str, maxShiftValue-1) else ())
    
(*test cases*)	
val original = "I am almost done woop woop";
val encrypted = encrypt(original, 7);
val decrypted = decrypt(encrypted, 7);
solve("FINALS", 26);