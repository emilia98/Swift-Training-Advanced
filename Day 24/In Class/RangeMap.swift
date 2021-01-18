var a = (0...10).map { $0 }
print(a)

var b = (0...10).map { _ in Int.random(in: 0 ... 10)}
print(b)