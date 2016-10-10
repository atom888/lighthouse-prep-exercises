var hash = "#";
var space = " ";
var size = 8;


for (var x = 1; x <= size; x++) {
    var line = " ";
    for (var y = 1; y <= size; y++) {
        if (x % 2 === 0) {
            if (y % 2 === 0) {
                line += space;
            }
            else {
                line += hash;
            }
        }
        else {
            if (y % 2 === 0) {
                line += hash;
            }
            else {
                    line += space;
                }
            }
        }
    console.log(line);
}
