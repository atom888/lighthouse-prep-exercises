function countBs (word) {
  var length = word.length;
  var counter = 0;

  for (var i = 0; i < length; i++) {
    if (word.charAt(i) == "B") {
      counter += 1;
    }
  }
  return counter;
}
//Test countBs function - determined the length of the word inputted,
//then goes through each character of the string using for loop,
//if one of those characters matchs "B", the counter value will increase //
console.log(countBs("BBC"));


function countChar(word, letter) {
  var length = word.length;
  var counter = 0;

  for (var i = 0; i < length; i++) {
    if(word.charAt(i) == letter) {
      counter += 1;
    }
  }
  return counter;
}
//Test countChars function - determined the length of the word inputted,
//then goes through each character of the string using for loop,
//if one of those characters matchs the letter inputted into function, the counter value will increase //
console.log(countChar("kakkerlak", "k"));