var a = [1, 2, 3, 4]

var b = a.map { $0 + a.count  }
print(b)