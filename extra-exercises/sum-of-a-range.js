//Range Function //
function Range(start, end) {
  var container = [];
  if (start > end) {
    for (var i = start; i >= end; i--) {
      container.push(i);
    }
      return container;
    }
  else if (start < end) {
    for (var i = start; i <= end; i++) {
      container.push(i);
    }
    return container;
  }

}
console.log(Range(1,4));
console.log(Range(7,2));

//Individual Sum Function //
function sum(array) {
    var total = 0;
    var length = array.length;
    for (var i = 0; i < length; i++) {
        total += array[i];
    }
    return total;
}
console.log(sum([1,2,3,4,5]));


//Combined Range and Sum Function //
function range(start, end) {
    var container = [];
    for (var i = start; i <= end; i++) {
        container.push(i);
    }
  return container;

  function sum(container) {
    var total = 0;
    var length = arriay.length;
    for (var i = 0;  i < length; i++) {
      total += array[i];
    }
    return total
  }
}
console.log(sum(range(1,10)));


