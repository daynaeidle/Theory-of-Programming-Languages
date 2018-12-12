object Main {
	//global variables
	var charVal: Int = 0
	var newVal: Int = 0
	var newChar: String = ""
	var overflow: Int = 0
	var i = 0;

	def main(args: Array[String]) {
      var originalStr : String = "This is a test string from Alan"
      println(originalStr)
      var encryptedStr : String  = encrypt(originalStr, 8)
      println(encryptedStr)
      var decryptedStr : String = decrypt(encryptedStr, 8)
      println(decryptedStr)
      solve("HAL", 25)
   }
   
   def encrypt(str: String, shiftAmount: Int) : String = {
      var strUpper : String = str.toUpperCase()
	  var newStr: String = ""
	  var length: Int = strUpper.length()
	  
	  for ( i <- 0 to (strUpper.length() - 1)) {

	      var currChar : Char = strUpper.charAt(i)
	      
	      if (currChar.toString == " "){
	          newChar = currChar.toString
	      }else{
	          charVal = currChar.toInt
	          newVal = charVal + shiftAmount
	          if (newVal > 90){
	              overflow = newVal - 90
	              newVal = 64 + overflow
	          }
	          newChar = (newVal.toChar).toString
	      }
	      newStr = newStr + newChar
	  
	  }
	  return newStr
   }
	      
   
   def decrypt(str: String, shiftAmount: Int) : String = {
       var strUpper : String = str.toUpperCase()
	   var newStr: String = ""
	   var length: Int = strUpper.length()
	  
	   for ( i <- 0 to (strUpper.length() - 1)) {
	      var currChar : Char = strUpper.charAt(i)
	      if (currChar.toString == " "){
	          newChar = currChar.toString
	      }else{
	          charVal = currChar.toInt
	          newVal = charVal - shiftAmount
	          if (newVal < 65){
	              overflow = 65 - newVal
	              newVal = 91 - overflow
	          }
	          newChar = (newVal.toChar).toString
	      }
	      newStr = newStr + newChar
	  
	  }
	  return newStr
       
   }
   
   def solve(str: String, maxShiftValue: Int){
       var shiftValue : Int = maxShiftValue
       var strUpper : String = str.toUpperCase()
	   var newStr: String = ""
	   var length: Int = strUpper.length()
	   
	   while (shiftValue > 0){
	       for ( i <- 0 to (strUpper.length() - 1)) {
	           var currChar : Char = strUpper.charAt(i)
	           if (currChar.toString == " "){
	               newChar = currChar.toString
	           }else{
	               charVal = currChar.toInt
	               newVal = charVal + shiftValue
	               if (newVal > 90){
	                   overflow = newVal - 90
	                   newVal = 64 + overflow
	               }
	           
	           }
	           newChar = (newVal.toChar).toString
	           newStr = newStr + newChar
	           
	       }
	       println(shiftValue + ": " + newStr)
	       shiftValue = shiftValue - 1
	       newStr = ""
	   }
       
   }
}
   def decrypt(str: String, shiftAmount: Int) : String = {
       var strUpper : String = str.toUpperCase()
	   var newStr: String = ""
	   var charVal: Int = 0
	   var newVal: Int = 0
	   var newChar: String = ""
	   var overflow: Int = 0
	   var length: Int = strUpper.length()
	   var i = 0;
	  
	   for ( i <- 0 to (strUpper.length() - 1)) {
	      var currChar : Char = strUpper.charAt(i)
	      if (currChar.toString == " "){
	          newChar = currChar.toString
	      }else{
	          charVal = currChar.toInt
	          newVal = charVal - shiftAmount
	          if (newVal < 65){
	              overflow = 65 - newVal
	              newVal = 91 - overflow
	          }
	          newChar = (newVal.toChar).toString
	      }
	      newStr = newStr + newChar
	  
	  }
	  return newStr
       
   }
   
   def solve(str: String, maxShiftValue: Int){
       var shiftValue : Int = maxShiftValue
       var strUpper : String = str.toUpperCase()
	   var newStr: String = ""
	   var charVal: Int = 0
	   var newVal: Int = 0
	   var newChar: String = ""
	   var overflow: Int = 0
	   var length: Int = strUpper.length()
	   var i = 0;
	   
	   while (shiftValue > 0){
	       for ( i <- 0 to (strUpper.length() - 1)) {
	           var currChar : Char = strUpper.charAt(i)
	           if (currChar.toString == " "){
	               newChar = currChar.toString
	           }else{
	               charVal = currChar.toInt
	               newVal = charVal + shiftValue
	               if (newVal > 90){
	                   overflow = newVal - 90
	                   newVal = 64 + overflow
	               }
	           
	           }
	           newChar = (newVal.toChar).toString
	           newStr = newStr + newChar
	           
	       }
	       println(shiftValue + ": " + newStr)
	       shiftValue = shiftValue - 1
	       newStr = ""
	   }
       
   }
}