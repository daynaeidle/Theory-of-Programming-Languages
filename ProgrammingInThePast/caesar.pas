program pascal(output);
var
	originalStr: string = 'cHoCoLaTeS';
	encryptedStr: string;
	decryptedStr: string;

Function encrypt(ogStr: string; shiftAmount: integer) : string;
    var
	    strUpper: string;
	    newStr: string = '';
	    charVal: integer;
	    newVal: integer;
	    newChar: char;
	    item: char;
	    overflow: integer;
	begin
	    strUpper := UpCase(ogStr);
	    for item in strUpper do
	    begin
    	    if item = ' ' then
    	        newChar := item
    	    else
    	        charVal:= Ord(item);
    	        newVal:= charVal + shiftAmount;
    	        if newVal > 90 then
    	        begin
    	            overflow := newVal - 90;
    	            newVal := 64 + overflow;
    	       end;
    	        newChar:= chr(newVal);
    	    newStr := newStr + newChar;
	    end;
	    encrypt := newStr;
	end;
	

Function decrypt(ogStr: string; shiftAmount: integer) : string;
var
	    strUpper: string;
	    newStr: string = '';
	    charVal: integer;
	    newVal: integer;
	    newChar: char;
	    item: char;
	    overflow: integer;
	begin
	    strUpper := UpCase(ogStr);
	    for item in strUpper do
	    begin
    	    if item = ' ' then
    	        newChar := item
    	    else
    	        charVal:= Ord(item);
    	        newVal:= charVal - shiftAmount;
    	        if newVal < 65 then
    	        begin
    	            overflow := 65 - newVal;
    	            newVal := 91 - overflow;
    	        end;
    	        newChar:= chr(newVal);
    	    newStr := newStr + newChar;
	    end;
	    decrypt := newStr;
	end;
	
function solve(ogStr: string; maxShiftValue: integer) : string;
var
    strUpper: string;
	newStr: string = '';
	charVal: integer;
	newVal: integer;
    newChar: char;
	item: char;
	overflow: integer;
begin
    strUpper := UpCase(ogStr);
        while maxShiftValue > 0 do
        begin
            for item in strUpper do
            begin
                if item = ' ' then
                    newChar := item
                else
                	charVal:= Ord(item);
                	newVal:= charVal + maxShiftValue;
            	    if newVal > 90 then
            	    begin
            	        overflow := newVal - 90;
            	        newVal := 64 + overflow;
            	   end;
                   newChar:= chr(newVal);
                   newStr := newStr + newChar;
                
            end;
            writeln(maxShiftValue, ': ', newStr);
            maxShiftValue := maxShiftValue -1;
            newStr := '';
        end;
end;


begin
    writeln('Test 1');
    writeln('Original: ' + originalStr);
    encryptedStr := encrypt(originalStr, 8);
    writeln('Encrypted: ' + encryptedStr);
    decryptedStr := decrypt(encryptedStr, 8);
    writeln('Decrypted: ' + decryptedStr);
    writeln(solve('SUN', 26));
    writeln();
    originalStr := 'hungry';
    writeln('Test 2');
    writeln('Original: ' + originalStr);
    encryptedStr := encrypt(originalStr, 8);
    writeln('Encrypted: ' + encryptedStr);
    decryptedStr := decrypt(encryptedStr, 8);
    writeln('Decrypted: ' + decryptedStr);
    writeln(solve('good', 26));
end.