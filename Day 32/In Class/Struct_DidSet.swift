struct Point {
    var x, y: Int

    // Mutating is used, because if we change
    // a value in a struct.
    // If a value is changed in struct,
    // the whole struct is changed.
    mutating func clear() {
        x = 0
        y = 0
    }

    mutating func reset() {
        for i in  0 ... 10 {
            self.x = i
        }
    }
}

var p: Point = Point(x: 0, y: 0) {
    didSet {
        print("didSet \(p.x), \(p.y)")
    }
}

print(p)
p.x = 1
print(p)

p.clear() // new struct is created
print(p)

p.reset() // changing x 10 times, but only one time the struct is overwritten
print(p)

// new struct is created 10 times
for i in  0 ... 10 {
    p.x = i
}