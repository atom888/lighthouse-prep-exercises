// FreeCodeCamp - Algorithm Exercise 'Reverse a String' //

function reverseString(str) {
  // split() returns an array on which reverse() and join() can be applied
   var strReverse = str.split('').reverse().join('');
   console.log(strReverse);
}

reverseString("hello");


