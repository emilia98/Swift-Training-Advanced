class Stack {
    var arr: [Int] = []
    
    func push(_ num : Int) {
        arr.append(num)
    }
    
    func pop() -> Int? {
        if arr.count == 0 {
            return nil
        }
        return arr.removeLast()
    }
    
    var isEmpty: Bool {
      get { return (arr.count == 0) }
    }
    
    var count: Int {
        get { return arr.count }
    }
}

func calculateExpression(_ str : [Character]) -> Int? {
    var currentNum = ""
    let nums = Stack()
    
    for c in str {
        if c == " " {
            if currentNum != "" {
                nums.push(Int(currentNum)!)
                currentNum = ""
            } 
        }
        else if ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].contains(c) {
            currentNum += String(c)
        }
        else {
            if let result = getResult(c, nums) {
                nums.push(result)
            } else {
                return nil
            }
        }
    }
    
    if nums.count > 0 {
        return nums.pop()
    }
    
    return nil
}

func getResult(_ c : Character, _ nums : Stack) -> Int? {
    if nums.count < 2 {
        return nil
    }
    
    let secondNum = nums.pop()!
    let firstNum = nums.pop()!
    var result : Int?
    
    switch c {
        case "+":
            result = firstNum + secondNum
            break
        case "-":
            result = firstNum - secondNum
            break
        case "*":
            result = firstNum * secondNum
            break
        case "/":
            result = firstNum / secondNum
            break
        default:
            result = nil
    }
    
    return result
}

func calculateExpression(_ str : String) -> Int? {
    return calculateExpression(Array(str))
}

func testCalculateExpression(_ str : String, _ expectedResult: Int?) {
    let actualResult = calculateExpression(str)
    let actualPlaceholder = actualResult != nil ? String(actualResult!) : "nil"
    let expectedPlaceholder = expectedResult != nil ? String(expectedResult!) : "nil"
    
    if actualResult != expectedResult {
        print("Testing calculateExpression() with str: \(str).\nActual result: \(actualPlaceholder) does not match Expected result: \(expectedPlaceholder)")
    }
}

testCalculateExpression("22 3 +", 25)
testCalculateExpression("3 1 -", 2)
testCalculateExpression("5 3 2 * -", -1)
testCalculateExpression("15 2 5 - /", -5)
testCalculateExpression("15 2 / /", nil)