// FreeCodeCamp - Algorithm Exercise 'Find the Longest Word in a String'

function findLongestWord(str) {
  // Convert the string into an array using split()
  var words = str.split(' ');
  // Have a variable that stores the length value
  var maxLength = 0;
  // Cycle through the words in the array
  for (var i = 0; i < words.length; i++) {
    // if a words length is longer than maxLength
    // make it the new maxLength
    if (words[i].length > maxLength) {
      maxLength = words[i].length;
    }
  }
  return maxLength;
}

findLongestWord("The quick brown fox jumped over the lazy dog");
