// FreeCodeCamp - Algotithm Exercise 'Palindromes' //

function palindrome(str) {
  // normalStr takes the original string and removes all non-alphanumeric characters
  // including '_'
  // takes all characters and converts to lower case
  var normalStr = str.replace(/[\W_]/g, '').toLowerCase();
  // takes the normal string and split() returns an array on which
  // reverse() and join() can be applied
  var reverseStr = normalStr.split('').reverse().join('');
    // if normalStr is equivalent to reverseStr - returns true
    // if not, returns false
    return normalStr === reverseStr;

}

palindrome("A man, a plan, a canal. Panama");