class Sequence {
    var ns = Set<Int>()
    var start = -1
    var end = -1
    var setCount : Int
    
    var len: Int {
        get { return end - start }
    }
    
    init(start: Int, num: Int, setCount: Int) {
        self.start = start
        self.setCount = setCount
    }
    
    func checkFull(_ num: Int) -> Bool {
        ns.insert(num)
        return ns.count == setCount
    }
}

func shortestSequence(_ a: [Int], _ nums: [Int]) -> [Int] {
    let ns = Set(nums)
    var sa: [Sequence] = []
    var (start, end) = (0, a.count - 1)
    var hasMatch = false
    
     for (i, v) in a.enumerated() {
         if ns.contains(v) {
            let seq = Sequence(start: i, num: v, setCount: ns.count)
            sa.append(seq)
            
            for (index, s) in sa.enumerated() {
                if s.checkFull(v) {
                    s.end = i
                    hasMatch = true
                    
                    if s.len < end - start {
                        (end, start) = (s.end, s.start)
                        sa.remove(at: index)
                    }
                }
            }
         } 
    }
    
    return hasMatch ? Array(a[start...end]) : []
}

var arr = [1, 4, 3, 8, 4, 2, 8, 2, 11, 1, 5, 13]
var nums = [1, 4, 8]
var sh = shortestSequence(arr, nums)
print(sh)

arr = [1, 4, 3, 8, 4, 2, 8, 2, 11, 1, 5, 13]
nums = [1, 4, 8, 3]
sh = shortestSequence(arr, nums)
print(sh)

arr = [1, 4, 8, 8, 4, 2, 8, 2, 11, 1, 5, 13]
sh = shortestSequence(arr, nums)
print(sh)

arr = [1, 4, 8, 0, 4, 2, 0, 2, 11, 0, 5, 3]
sh = shortestSequence(arr, nums)
print(sh)