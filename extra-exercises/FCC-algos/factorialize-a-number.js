// FreeCodeCamp - Algorithm Exercises 'Factorizalize a Number' //

function factorialize(num) {
  // if the number provided is 0 - return 1
  if (num === 0) {
    return 1;
  }
  // if the number is not 0 - return the value of the number as it decreases till it hits zero
  return num * factorialize(num - 1);
}

factorialize(5);



// For-loop version //
function factorialize(num) {
  // Set a variable with the value 1 - this can be returned if the for loop doesn't need to run
  var factorial = 1;
  // 'i' acts as a counter to reach the value of the num provided
  // As 'i' increases it multiples its current value to the favtorial variable
    for (var i = 2; i <= num; i++) {
      factorial = factorial * i;
    }
    return factorial;
  }

factorialize(5);