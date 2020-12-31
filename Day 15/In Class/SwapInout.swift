func swap(_ a: inout Int, _ b: inout Int) {
    var t = a
    a = b
    b = t
}

var a = 2, b = 1
print(a, b)
swap(&a, &b)
print(a, b)