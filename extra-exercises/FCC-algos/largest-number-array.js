// FreeCodeCamp - Algorithm Exercise 'Return Largest Numbers in Arrays'


function largestOfFour(arr) {
// Create an array that will store the  results of the sub-arrays
  var largestNumber = [0,0,0,0];
// A for loop is needed to iterate through the array
  for (var i = 0; i < arr.length; i++) {
    // Need another for-loop to iterate through the sub-arrays
    for (var j = 0; j < arr[i].length; j++) {
     // Need to determine which is the largest sub-element of the sub-arrays
     // Store the largest value into the proper position of the largestNumber array
      if (arr[i][j] > largestNumber[i]) {
        largestNumber[i] = arr[i][j];
      }
    }
  }
return largestNumber;
}



largestOfFour([[4,5,1,3], [13,27,18,26], [32,35,37,39], [1000,1001,857,1]]);