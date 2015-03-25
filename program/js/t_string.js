var s = '戴忠';
var i;
for (i = 0; i < s.length; i++) {
    console.log(i + ' ' + s.charAt(i) + ' ' + s.charCodeAt(i));
}

//match
var s1 = '1a2b';
var reg1 = /\d+/;
var reg2 = /[^\d]+/g;
var reg3 = /(\d)+/;
console.log(reg1.exec(s1));
console.log(s1.match(reg1));
console.log(s1.match(reg3));
console.log(s1.match(reg2));

//0 戴 25140 1 忠 24544
var str = String.fromCharCode(25140, 24544);
console.log(str);