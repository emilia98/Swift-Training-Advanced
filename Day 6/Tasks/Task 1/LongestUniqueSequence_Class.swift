class Sequence {
    var start : Int
    var end : Int
    
    var len : Int {
        get { return end - start }
    }
    
    init(start : Int, end : Int) {
        self.start = start
        self.end = end
    }
}

func longestSequence(_ arr : [Int]) -> [Int] {
    var currentSeq = Set<Int>()
    let seq = Sequence(start: 0, end: 0)
    var longestSeqCount = 0
    var longestSeq = Sequence(start: 0, end: 0)
    
    for (i, v) in arr.enumerated() {
        
        if (currentSeq.contains(v)) {
            seq.end = i - 1
            
            if seq.len > longestSeqCount {
                longestSeq = Sequence(start: seq.start, end: seq.end)
                longestSeqCount = seq.len + 1
            }
            
            seq.start = i
            currentSeq = Set<Int>()
        }
        
        currentSeq.insert(v)
    }
    
    return Array(arr[longestSeq.start...longestSeq.end])
}

var arr = [1, 3, 7, 5, 2, 3, 8, 3]
var longestSeq = longestSequence(arr)
print(longestSeq)

arr = [3, 3, 7, 5, 2, 3, 8, 3]
longestSeq = longestSequence(arr)
print(longestSeq)