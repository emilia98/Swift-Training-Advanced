class BitSet {
    var size: Int
    var bits : UInt

    init(_ size: Int) {
        self.size = size
        bits = 0
    }

    func set(_ x : Int) {
        if (x > size) {
            return 
        }
        let mask : UInt = 1 << x
        bits = bits | mask
    }

    func get(_ x : Int) -> Bool {
        if (x > size) {
            return false
        }
        
        let mask : UInt = 1 << x
        return (mask & bits) != 0
    }

    func clear(_ x : Int) {
        if (x > size) {
            return
        }
        
        let mask : UInt = 1 << x
        bits = ~mask & bits
    }

    func setBitCount() -> Int {
        var bitsCount = 0
        var x = self.bits

        while x > 0 {
            bitsCount += Int(x & 1)
            x = x >> 1
        }
        return bitsCount
    }
}

var bitSet = BitSet(8)
bitSet.set(0) // 1
print(bitSet.bits) // 1
bitSet.set(3) // 1001
print(bitSet.get(2)) // 0 -> false
print(bitSet.get(3)) // 1 -> true
bitSet.set(4) // 11001
print(bitSet.setBitCount()) // 11001 -> 3
bitSet.clear(4) // 1001
print(bitSet.setBitCount()) // 1001 -> 2
