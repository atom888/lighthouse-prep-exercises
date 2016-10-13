//Reverse Array Function//

function reverseArray(array) {
  var hold = [];
  for (var i = array.length - 1; i >= 0; i--) {
    hold.push(array[i]);
  }
  return hold;
}

console.log(reverseArray(["A",1 ,"B" ,4,"C"]));



//Reverse Array in Place //



function reverseArrayInPlace(arrayValue) {
  var hold = [];
  var length = arrayValue.length - 1;
  var midpoint = Math.floor(length/2);

  for (var i = length; i >= midpoint; i--) { //goes through array from last element to middle
    hold = arrayValue[i]; //temporary holds last element
    arrayValue[i] = arrayValue[length - i]; // last element becomes first element
    arrayValue[length - i] = hold; //first element becomes last element
  }
  return arrayValue;
}


console.log(reverseArrayInPlace([1, 2, 3]));