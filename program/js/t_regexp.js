var text = '<html><body bgcolor=linen></body></html>';
var tags = /[^<>]+|<(\/?)([A-Za-z]+)([^<>]*)>/g;
var a, i;

while(a = tags.exec(text)) {
    for(i = 0; i < a.length; i += 1) {
        console.log('// [' + i + ']' + a[i]);
    } 
    //document.writeln();
}