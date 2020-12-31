func customSwap<T>(_ a: inout T, _ b: inout T) {
    var t = a
    a = b
    b = t
}

/* The compliers do this, the generic implementation does not exist, except in the code
func customSwap_Int(_ a: inout Int, _ b: inout Int) {
    var t = a
    a = b
    b = t
}
*/

var a = "aa"
var b = "bb"

print(a, b)
swap(&a, &b)
print(a, b)