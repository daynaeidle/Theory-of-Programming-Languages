function encrypt(myStr as String, shiftAmount as integer) as String
    var strUpper = ucase(myStr)
    var currChar = ""
	var newStr = ""
	var length = Len(strUpper)
	var charVal = 0
	var newVal = 0
	var newChar = ""
	var item = ""
	var overflow = 0
	var i = 0
	
	do until(i > length)
	    currChar = Mid(strUpper, i, 1)
	    if (currChar = " ") then
	        newChar = currChar
	    else
	        charVal= Asc(currChar)
    	    newVal= charVal + shiftAmount
    	    if newVal > 90 then
    	        overflow = newVal - 90
    	        newVal = 64 + overflow
    	    end if
    	    newChar= chr(newVal)
    	end if
    	newStr = newStr + newChar
	    i += 1
	loop
	
	return newStr
end function

function decrypt(myStr as string, shiftAmount as integer) as String

    var strUpper = ucase(myStr)
    var currChar = ""
	var newStr = ""
	var length = Len(strUpper)
	var charVal = 0
	var newVal = 0
	var newChar = ""
	var item = ""
	var overflow = 0
	var i = 0
	
	do until(i > length)
	    currChar = Mid(strUpper, i, 1)
	    if (currChar = " ") then
	        newChar = currChar
	    else
	        charVal= Asc(currChar)
    	    newVal= charVal - shiftAmount
    	    if newVal < 65 then
    	        overflow = 65 - newVal
    	        newVal = 91 - overflow
    	    end if
    	    newChar= chr(newVal)
    	end if
    	newStr = newStr + newChar
	    i += 1
	loop
	
	return newStr
end function

sub solve(myStr as string, maxShiftValue as integer)

    var strUpper = ucase(myStr)
    var currChar = ""
	var newStr = ""
	var length = Len(strUpper)
	var charVal = 0
	var newVal = 0
	var newChar = ""
	var item = ""
	var overflow = 0
	
	
	do until (maxShiftValue <= 0)
	    var i = 0
    	do until(i > length)
    	    currChar = Mid(strUpper, i, 1)
    	    if (currChar = " ") then
    	        newChar = currChar
    	    else
    	        charVal= Asc(currChar)
        	    newVal= charVal + maxShiftValue
        	    if newVal > 90 then
        	        overflow = newVal - 90
        	        newVal = 64 + overflow
        	    end if
        	    newChar= chr(newVal)
        	    newStr = newStr + newChar
        	end if
    	    i += 1
    	loop
    	print maxShiftValue, ": ", newStr
        maxShiftValue -= 1
        newStr = ""
    loop
end sub

sub main
    dim originalStr as String
    print "Test 1"
    originalStr = "This is a test string from Alan"
    print "Original: " + originalStr 
    var encryptedStr = encrypt(originalStr, 8)
    print "Encrypted: " + encryptedStr
    var decryptedStr = decrypt(encryptedStr, 8)
    print "Decrypted: " + decryptedStr
    solve("HAL", 26)
    print " "
    print "Test 2"
    originalStr = "donuts"
    print "Original: " + originalStr 
    encryptedStr = encrypt(originalStr, 8)
    print "Encrypted: " + encryptedStr
    decryptedStr = decrypt(encryptedStr, 8)
    print "Decrypted: " + decryptedStr
    solve("LOL", 26)
end sub

main()