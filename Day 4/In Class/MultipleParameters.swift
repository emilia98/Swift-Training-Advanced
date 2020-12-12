func min(a : Int...) -> Int {
    var min = Int.max

    for e in a {
        if e < min {
            min = e
        }
    }

    return min
}

var m = min(1, 2, -1, 5)
print(m)