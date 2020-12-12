// nil coalescing operator

var a:Int? = nil
var b = 5

var c = a ?? b

print(c)

a = 6
c = a ?? b
print(c)


a = nil
c = a != nil ? a! : b
print(c)
