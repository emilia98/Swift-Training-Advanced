var a = [1, 2, 3, 4]

var b = a.reduce([]) {x, y in x + [y + 1]}
print(b)