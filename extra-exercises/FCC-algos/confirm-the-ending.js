// FreeCodeCamp - Algorithm Exercise 'Confirm the Ending'

function confirmEnding(str, target) {

// By subtracting the target length for  the string length
// we have a start value for the 'substr'
var start = str.length - target.length;

if (str.substr(start, str.length) === target) {
  return true;
}
else {
  return false;
}

}

confirmEnding("Open sesame", "same");