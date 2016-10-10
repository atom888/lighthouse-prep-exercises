function min(num1, num2) {
  if (num1 < num2) {
    return num1;
  }
  else if (num2 < num1) {
    return num2;
  }
  else if (num1 === num2) {
    return "The numbers entered are the same - both are the minimum."
  }
}
//Test min function - two inputs compared against each other to determin which one is the smallest //
console.log(min(0,10)); //Function should produce '0'//

console.log(min(0,-10)); //Function should produce '-10' //

console.log(min(2,2)); // Function should produce "The numbers entered are the same - both are the minimum." //