class CircleBuffer {
    var buffer : [Int]
    var bufferCount : Int
    var index = 0
    
    init(_ bufferCount : Int) {
        self.bufferCount = bufferCount
        self.buffer = Array(repeating: 0, count: bufferCount)
    }
    
    func write(_ arr : [Int]) {
        for element in arr {
            if index == bufferCount {
                index = 0
            }
            
            buffer[index] = element
            index += 1
        }
    }
    
    func read() -> [Int] {
        return buffer
    }
}

var circleBuffer = CircleBuffer(5)
circleBuffer.write([5, 0, 0])
var data = circleBuffer.read()
print(data)

circleBuffer.write([10, 11, 12])
data = circleBuffer.read()
print(data)

circleBuffer.write([5, 6, 7, 8, 9])
circleBuffer.write([1, 2, 3, 4, 5, 6])
data = circleBuffer.read()
print(data)