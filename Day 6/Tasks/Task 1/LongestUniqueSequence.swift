func longestSequence(_ arr : [Int]) -> [Int] {
    var currentSeq = Set<Int>()
    var (start, end) = (0, 0)
    var longestSeqCount = 0
    var (longestStart, longestEnd) = (0, 0)
    
    for (i, v) in arr.enumerated() {
        
        if (currentSeq.contains(v)) {
            end = i - 1
            
            if end - start > longestSeqCount {
                (longestStart, longestEnd) = (start, end)
                longestSeqCount = end - start + 1
            }
            start = i
            currentSeq = Set<Int>()
        }
        
        currentSeq.insert(v)
    }
    
    return Array(arr[longestStart...longestEnd])
}

var arr = [1, 3, 7, 5, 2, 3, 8, 3]
var longestSeq = longestSequence(arr)
print(longestSeq)

arr = [3, 3, 7, 5, 2, 3, 8, 3]
longestSeq = longestSequence(arr)
print(longestSeq)