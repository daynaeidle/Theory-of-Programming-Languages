-module(prog).
-import(string,[to_upper/1]). 
-export([mod/2, shiftChar/2, encrypt/2, decrypt/2, main/0]).
 
%mod function because rem doesn't handle negatives well
mod(X,Y) when X > 0 -> 
	X rem Y;
mod(X,Y) when X < 0 -> 
	Y + X rem Y;
mod(0,Y) -> 0.
 
%shifts char certain amount -- does nothing for spaces
shiftChar(Char, ShiftAmount) when (Char /= 32) ->
	mod(((Char - $A) + ShiftAmount), 26) + $A;
shiftChar(Char, ShiftAmount) ->
	Char.
 
%encrypts a string
encrypt(Str, ShiftAmount) ->
	%calls shiftChar function on each character of string
	NewStr = [shiftChar(Char, ShiftAmount) || Char <- to_upper(Str)].
 
%decrypts a string
decrypt(Str, ShiftAmount) ->
	%calls encrypt using negative shift amount
	encrypt(Str, (ShiftAmount * -1)).
 
%solves cipher for every value from maxShiftValue to 0
%ends recursion when maxshiftvalue hits 0
solve(Str, 0) ->
	ok;
solve(Str, MaxShiftValue) ->
	%calls encrypt with current counter number and prints it
	NewStr = encrypt(Str, MaxShiftValue),
	io:format("~s~n", [NewStr]),
	%decreases counter and calls solve again
	solve(Str, MaxShiftValue - 1).
 
main() ->
	Original = "Just another test case",
	Encrypted = encrypt(Original, 3),
	Decrypted = decrypt(Encrypted, 3),
	io:format("Original: ~s~n", [Original]),
	io:format("Encrypted: ~s~n", [Encrypted]),
	io:format("Decrypted: ~s~n", [Decrypted]),
	io:format("Solved String: ~s~n", ["TEST"]),
	solve("TEST", 26).