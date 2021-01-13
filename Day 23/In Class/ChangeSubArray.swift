var a = [1, 2, 3]
var b = a[1...]

// b[0] = 1
b[1] = 1
print(b)

var s = "abcdadada"
var s1 = s.prefix(3)
s1 += "134"
print(s1)