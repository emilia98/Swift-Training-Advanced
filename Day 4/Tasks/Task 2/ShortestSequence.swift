func findShortestSequence(_ arr : [Int], _ query : [Int]) -> [Int] {
    var currentSequence = [Int]()
    var allSequences = [[Int]]()
    var currentSequenceSet = Set<Int>()
    var minSequenceCount = arr.count
    var minSequenceIndex = 0
    
    for x in arr {
        currentSequence.append(x)
        
        if query.contains(x) {
            currentSequenceSet.insert(x)
            
            if currentSequenceSet.count == query.count {
                allSequences.append(currentSequence)
                
                if minSequenceCount > currentSequence.count {
                    minSequenceIndex = allSequences.count - 1
                    minSequenceCount = currentSequence.count
                }
                
                // Reset the current sequence
                currentSequence = [Int]()
                currentSequence.append(x)
                // Reset the set with all the query elements
                currentSequenceSet = Set<Int>()
                currentSequenceSet.insert(x)
            }
        }
    }
    
    return allSequences[minSequenceIndex]
}

var arr = [1, 3, 8, 4, 2, 8, 2, 11, 1, 5, 13]
var query = [1, 4, 8]

var shortestSequence = findShortestSequence(arr, query)
print(shortestSequence)


arr = [1, 3, 8, 4, 1, 8, 2, 11, 1, 5, 13]
shortestSequence = findShortestSequence(arr, query)
print(shortestSequence)