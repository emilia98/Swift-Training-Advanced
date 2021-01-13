var a = [1, 2, 3, 4]

func filterFunc( _ e: Int) -> Bool {
    return e > 2
}

var f = filterFunc
print(f)

var b = a.filter(f)
print(b)

b = a.filter({(e) -> Bool in return e > 2 })
print(b)

b = a.filter { $0 > 2 }
print(b)
