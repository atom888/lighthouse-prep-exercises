
function isEven(number) {
  if (number ==0){
    return true;
  }
  else if (number ==1) {
    return false;
  }
  else if (number < 0) {
    return isEven(-number);
  }
  else {
    return isEven(number -2);
  }
}

//Test to see if isEven function works properly//
console.log(isEven(8)); //Should return true//

console.log(isEven(3)); //Should return false//

//Testing negative value//
console.log(isEven(-2)); //Should return true//