import Foundation

func getMissingNum(_ str : String) -> Int {
    let maxDigitsCount = str.count / 2
    let characters = Array(str)
    var possibleValues = [(first: Int, next: Int)]()
    
    for i in 1...maxDigitsCount {
        let offset = i
        
        let first = formNumber(characters, 0, offset)
        let next = formNumber(characters, offset, offset + i)
        
        if (next - first == 2 || next - first == 1) {
            possibleValues.append((first: first, next: next))
            continue
        }  
        
        if (offset + i + 1 <= characters.count) {
            let secondNext = formNumber(characters, offset, offset + i + 1)
            if (secondNext - first == 2 || secondNext - first == 1) {
                possibleValues.append((first: first, next: secondNext))
            }
        }
    }
    
    if (possibleValues.count == 0) {
        return -1
    }
    
    let numPair = possibleValues[possibleValues.count - 1]
    
    if (numPair.next - numPair.first == 2) {
        return numPair.first + 1
    }
    
    var result = ""
    var startNum = numPair.first
    
    while result.count < str.count {
        result += String(startNum)
        
        let idx = str.index(str.startIndex, offsetBy: result.count)
        let temp = str[..<idx]
        
        if result != temp {
            return startNum
        }
        
        startNum += 1
    }
    
    return -1
}

func formNumber(_ characters : [Character], _ start : Int, _ end : Int) -> Int {
    let numDigits = characters[start..<end]
    return Int(numDigits.map{ String($0) }.joined(separator: ""))!
}

var missingNum = getMissingNum("123567")
print(missingNum)

missingNum = getMissingNum("2526282930")
print(missingNum)

missingNum = getMissingNum("123125") 
print(missingNum)

missingNum = getMissingNum("9101113")
print(missingNum)

missingNum = getMissingNum("99910001002")
print(missingNum)