let defaultBufSize = 5

class CircularBuffer {
    private var a: [Int]
    private var idx = 0
    private var size = 0
    private var isFull = false
  
    init(size: Int = defaultBufSize) {
        self.a = Array(repeating: 0, count: size)
        self.size = size
    }
  
    func write(data: [Int]) {
        for d in data {
            a[idx] = d
            if idx == a.count - 1 {
                idx = -1
                isFull = true
            }
            idx += 1
        }
    }
  
    func read() -> [Int] {
        var result: [Int]
        if !isFull {
            result = [Int](a[0..<idx])
        }else{
            result = [Int](a[idx..<a.count] + a[0..<idx])
        }
        a = Array(repeating: 0, count: size)
        idx = 0
        return result
    }
}

var cb = CircularBuffer()
cb.write(data: [1, 2])
cb.write(data: [6,7,8,9])
print(cb.read())