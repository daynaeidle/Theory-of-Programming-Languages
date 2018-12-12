object Main {
	def main(args: Array[String]) {
      var originalStr : String = "Hi my name is Dayna"
      println("Original: " + originalStr)
      var encryptedStr : String  = encrypt(originalStr, 5)
      println("Encrypted: " + encryptedStr)
      var decryptedStr : String = decrypt(encryptedStr, 5)
      println("Decrypted: " + decryptedStr)
      solve("DOG", 26)
   }
   
   //encrypt a string
   def encrypt(str: String, shiftAmount: Int) : String = {
      //make string uppercase
	  var strUpper = str.map(c => c.toUpper)
	  //map string to shifted characters using shift function
	  var newStr = strUpper.map(x => shift(x, shiftAmount ))
	  return newStr
   }
   
   //decrypt a string
   def decrypt(str: String, shiftAmount: Int) : String = {
       //make string uppercase
	  var strUpper = str.map(c => c.toUpper)
	  //call encrypt and pass in negative shiftamount
	  var newStr = encrypt(strUpper, (shiftAmount * -1))
	  return newStr
   }
   
   //shift a character
   def shift(char : Char, shiftAmount : Int) : Char = {
       //if character is a space don't change anything
       if (char.toInt == 32){
           return char
       }else{
           //otherwise shift the character by shiftAmount and handle overflow/wraparound
           var newChar = ((Math.floorMod(((char.toInt - 'A'.toInt) + shiftAmount), 26)) + 'A'.toInt).toChar
           return newChar
       }
   }
   
   def solve(str : String, maxShiftValue : Int){
       
       var newStr : String = ""
       var shiftVal : Int = maxShiftValue
       
       //call encrypt for maxShiftValue -> 0 and print results
       while (shiftVal > 0){
           newStr = encrypt(str, shiftVal)
           println(shiftVal + ": " + newStr)
           shiftVal = shiftVal - 1
       }
   }
}