func _min<T : Comparable>(_ a: T, _ b: T) -> T {
    return a > b ? b : a
}

var a = 5, b = 1
var c = min(a, b)
print(a, b, c)

var d1 = 5.67
var d2 = 2.34
var d = min(d1, d2)
print(d1, d2, d)

var str1 = "aa"
var str2 = "bb"
var str = min(str1, str2)
print(str1, str2, str)







