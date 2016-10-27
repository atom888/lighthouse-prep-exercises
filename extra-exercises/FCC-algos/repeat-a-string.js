// FreeCodeCamp - Algorithm Exercise 'Repeat a String'


function repeatStringNumTimes(str, num) {
// create a variable that will store the str value
var newStr = '';

// if num value is lower than zero return an empty string
if ( num < 0) {
  return newStr;
}
else {
  // use a for loop to iterate the value of number
  // each iteration adds the string to the new string variable
  // returns the new string with all of the added string values.
  for (var i = 0; i < num; i++) {
    newStr += str;
  }
  return newStr;
}


}

repeatStringNumTimes("x", 8)