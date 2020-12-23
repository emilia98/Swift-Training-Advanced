func balancedBrackets(_ str: inout [Character], index: Int, indexes: inout [(start: Int, end: Int)]) -> Bool { 
    if index == str.count {
        for i in indexes {
            if i.end == -1 {
                return false
            }
        }
        return true
    }
    
    let s = str[index]
    
    if s == "(" {
        indexes.append((start: index, end: -1))
    } else if s == ")" {
        if indexes.count == 0 {
            return false
        }
        
        if indexes[indexes.count - 1].end > -1 {
           return false
        } 
        
        indexes[indexes.count - 1].end = index
        
        let temp = indexes.removeLast()
        indexes.insert(temp, at: 0)
    }
    
    return balancedBrackets(&str, index: index + 1, indexes: &indexes)
}

func balancedBrackets(_ str: String) -> (indexes: [(start: Int, end: Int)], isBalanced: Bool) {
    var arr : [Character] = Array(str)
    var indexes = [(start: Int, end: Int)]()
    let res = balancedBrackets(&arr, index: 0, indexes: &indexes)
  
    if !res {
        indexes = [(start: Int, end: Int)]()
    }
  
    return (indexes: indexes, isBalanced: res)
}

func testIfBalanced(_ str : String, _ expectedResult : Bool) {
    let actualResult = balancedBrackets(str).isBalanced
    
    if actualResult != expectedResult {
        print("Testing balancedBrackets() with \(str). \nActual result: \(actualResult) does not match the expected result: \(expectedResult)")
    }
}

func testIfShowsTheCorrectIndexes(_ str : String, _ expectedStartIndexes: [Int], _ expectedEndingIndexes: [Int]) 
{
    let actualResult = balancedBrackets(str).indexes
    let actualStartIndexes = actualResult.map { $0.start }
    let actualEndIndexes = actualResult.map { $0.end }
    
    if (actualStartIndexes != expectedStartIndexes) {
        print("Testing balancedBrackets() with \(str).")
        print("--- start indexes")
        print("Actual result: \(actualStartIndexes) does not match the expected result: \(expectedStartIndexes)")
    }
    
    if (actualEndIndexes != expectedEndingIndexes) {
        print("Testing balancedBrackets() with \(str).")
        print("--- end indexes")
        print("Actual result: \(actualEndIndexes) does not match the expected result: \(expectedEndingIndexes)")
    }
}

var testCases = [
    (str: "", isBalanced: true, startIndexes: [], endIndexes: []),
    (str: "(((())))", isBalanced: true, startIndexes: [0, 1, 2, 3], endIndexes: [7, 6, 5, 4]),
    (str: "()", isBalanced: true, startIndexes: [0], endIndexes: [1]),
    (str: "(())", isBalanced: true, startIndexes: [0, 1], endIndexes: [3, 2]),
    (str: "()()", isBalanced: true, startIndexes: [2, 0], endIndexes: [3, 1]),
    (str: "(()()())()", isBalanced: true, startIndexes: [8, 0, 5, 3, 1], endIndexes: [9, 7, 6, 4, 2]),
    (str: "((()", isBalanced: false, startIndexes: [], endIndexes: []),
    (str: "()))", isBalanced: false, startIndexes: [], endIndexes: []),
    (str: ")(", isBalanced: false, startIndexes: [], endIndexes: []),
    (str: "()((())", isBalanced: false, startIndexes: [], endIndexes: [])
]

// Test if brackets are balanced or not
for test in testCases {
    testIfBalanced(test.str, test.isBalanced)
}

// Test if returning the correct indexes
for test in testCases {
    testIfShowsTheCorrectIndexes(test.str, test.startIndexes, test.endIndexes)
}
