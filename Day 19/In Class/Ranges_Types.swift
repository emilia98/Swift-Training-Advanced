var a = 1 ..< 5
print(a, type(of: a), a.upperBound, a.lowerBound)

var b = 1 ... 5
print(b, type(of: b), b.upperBound, b.lowerBound)

var c = ...5
print(c, type(of: c), c.upperBound)

var d = 1...
print(d, type(of: d), d.lowerBound)