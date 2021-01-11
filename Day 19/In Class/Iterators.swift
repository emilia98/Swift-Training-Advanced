let s = "Hello"
for c in s {
    print(c)
}

var i = s.makeIterator()

while let c = i.next() {
    print(c)
}

struct MyCountdown: Sequence {
    func makeIterator() -> CountdownIterator {
        return CountdownIterator(self)
    }
}


struct CountdownIterator : IteratorProtocol {
    mutating func next() -> Int? {
    }
}