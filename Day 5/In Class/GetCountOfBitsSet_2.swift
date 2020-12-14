let bitsInUInt = 64

func getBitCount(_ x: UInt64) -> Int {
    var bitsCount = 0
    var mask: UInt64 = 1
    
    while mask != 0 {
        let res = mask & x
        if res > 0 {
            bitsCount += 1
        }

        mask = mask << 1
    }
    return bitsCount
}

var y = getBitCount(7)
print(y)