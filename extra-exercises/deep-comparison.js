//Deep Comparison Function//

function deepEqual(value1, value2) {
    if (value1 === value2) {
      return true;
      if (value1 == null || typeof value1 != "object" || value2 == null || typeof value2 != "object") {
        return false;
      }
    }
    var propertiesInValue1 = 0;
    var propertiesInValue2 = 0;

    for (var prop in propertiesInValue1) {
      propertiesInValue1 += 1;
    }

    for (var prop in propertiesInValue2) {
      propertiesInValue2 += 1;
      if (!(prop in propertiesInValue1) || !deepEqual(value1[prop], value2[prop])) {
        return false;
      }
    }

    return propertiesInValue1 == propertiesInValue2;

}

  var obj = {here: {is: "an"}, object: 2};
  console.log(deepEqual(obj, obj));

  console.log(deepEqual(obj, {here: 1, object: 2}));

  console.log(deepEqual(obj, {here: {is: "an"}, object: 2}));


  //Need to return to - understand fully //