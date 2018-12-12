program Caesar_Cipher
  implicit none

  character(50) :: originalStr = "THE QUICK BROWN FOX JUMPED OVER THE LAZY DOG"
  character(50) :: solveStr = "MAP"
  character(50) :: encryptedStr
  character(50) :: decryptedStr
  character(50) :: tempString
 
  write(*, "(2a)") "Test 1"
  write(*, "(2a)") "Original: ", originalStr
  tempString = encrypt(originalStr, 8)
  write(*, "(2a)") "Encrypted: ", encryptedStr
  tempString = decrypt(encryptedStr, 8)
  write(*, "(2a)") "Decrypted: ", decryptedStr
  tempString = solve(solveStr, 26)
  write(*, "(2a)")
  write(*, "(2a)") "Test 2"
  originalStr = "ARUBA"
  write(*, "(2a)") "Original: ", originalStr
  tempString = encrypt(originalStr, 8)
  write(*, "(2a)") "Encrypted: ", encryptedStr
  tempString = decrypt(encryptedStr, 8)
  write(*, "(2a)") "Decrypted: ", decryptedStr
  solveStr = "MOM"
  tempString = solve(solveStr, 26)
 
contains
 
character function encrypt(str, shiftAmount)
  character(*), intent(inout) :: str
  character :: newChar, currChar
  integer ::  shiftAmount, i, charVal, newVal, overflow
 
  do i=1, len(str)
      currChar = str(i:i)
      if (currChar == ' ') then
        newChar = currChar
      else
        charVal = ichar(currChar)
        newVal = charVal + shiftAmount
        if (newVal > 90) then
          overflow = newVal - 90
          newVal = 64 + overflow
        end if
        newChar = achar(newVal)
      end if
        str(i:i) = newChar
  end do
  encryptedStr = str
  encrypt = str
  return
end function
 
character function decrypt(str, shiftAmount)
  character(*), intent(inout) :: str
  character :: newChar, currChar
  integer ::  shiftAmount, i, charVal, newVal, overflow
 
  do i=1, len(str)
      currChar = str(i:i)
      if (currChar == ' ') then
        newChar = currChar
      else
        charVal = ichar(currChar)
        newVal = charVal - shiftAmount
        if (newVal <  65) then
          overflow = 65 - newVal
          newVal = 91 - overflow
        end if
        newChar = achar(newVal)
      end if
        str(i:i) = newChar
  end do
  decryptedStr = str
  decrypt = str
  return
end function

character function solve(str, maxShiftValue)
  character(*), intent(inout) :: str
  character :: newChar, currChar
  integer ::  maxShiftValue, i, charVal, newVal, overflow, j
  
  do j = 26, 1, -1
      do i=1, len(str)
          currChar = str(i:i)
          if (currChar == ' ') then
            newChar = currChar
          else
            charVal = ichar(currChar)
            newVal = charVal - j
            if (newVal <  65) then
              overflow = 65 - newVal
              newVal = 91 - overflow
            end if
            newChar = achar(newVal)
          end if
            str(i:i) = newChar
      end do
      print *, j, ": ", str
  end do
  solve = str
  return
  
end function
 
end program Caesar_Cipher