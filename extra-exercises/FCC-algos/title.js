// FreeCodeCamp - Algorithm Exercise "Title Case a Sentence"

function titleCase(str) {
  // Normalize the string by making every letter a lower case
  // then split the string into an array
  var words = str.toLowerCase().split(' ');
  // Need to cycle through each element in the array -
  // looking at the first character and making it into an uppercase.
  // CharAt(0) allows to isolate the first letter of each element and
  // apply an uppercase to it - then add the remaining letter back to the first letter.
  for (var i = 0; i < words.length; i++) {
    words[i] = words[i].charAt(0).toUpperCase() + words[i].slice(1);
  }

  // Return the words from the array back as a string
  return words.join(' ');

}


titleCase("I'm a little tea pot");