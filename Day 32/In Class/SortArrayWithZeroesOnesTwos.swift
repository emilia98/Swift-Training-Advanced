func sort(_ a : inout [Int]) {
    var count = Array(repeating: 0, count: 3)
    a.forEach { count[$0] += 1 }

    (0 ..< count[0]).forEach { a[$0] = 0 }
    var pos1 = count[0] + count[1]
    (count[0] ..< pos1).forEach { a[$0] = 1 }
    (pos1 ..< a.count).forEach { a[$0] = 2 }
}

var a = [0, 1, 2, 2, 0, 0, 1, 1]
sort(&a)
print(a)