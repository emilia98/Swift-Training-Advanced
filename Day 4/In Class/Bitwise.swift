// 1 & 1 = 1
// 1 & 0 = 0
// 0 & 1 = 0
// 0 & 0 = 0

// 1 | 1 = 1
// 1 | 0 = 1
// 0 | 1 = 1
// 0 | 0 = 0

// ~0 = 1
// ~1 = 0

// 10 -> 01
/*
var a: UInt = 0b01
var b: UInt = ~a
print(b)
*/

func isSet(_ x : UInt, offset : Int) -> Bool {
    // 000000001000 mask
    // 000000001011 x
    // 000000001000 res
    var mask : UInt = 1 << offset
    return (mask & x) != 0
}

func setBit(_ x: UInt, offset: Int) -> UInt {
    var mask : UInt = 1 << offset
    return mask | x
}

func clearBit(_ x: UInt, offset: Int) -> UInt {
    // 000000001000 ~
    // 111111110111 mask
    // 000000000011 x
    // 000000000011
    var mask : UInt = ~(1 << offset)
    return mask & x
}

var x = setBit(3, offset: 3)


print(x)

x = clearBit(x, offset: 3)
print(x)

var result = isSet(11, offset: 3)
print(result)






