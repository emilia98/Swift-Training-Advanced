let bitsInUInt = 64
func getBitCount(_ x: UInt64) -> Int {
    var bitsCount = 0
    var i = 0
    while i <= bitsInUInt {
        let mask: UInt64 = 1 << i
        let res = mask & x
        if res > 0 {
            bitsCount += 1
        }
        i += 1
    }
    return bitsCount
}
var y = getBitCount(7)
print(y)