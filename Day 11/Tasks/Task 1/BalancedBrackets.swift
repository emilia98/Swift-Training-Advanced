func balancedBrackets(_ str: inout [Character], index: Int) -> Bool {
    if str.count == 0 || index == str.count {
        return str.count == 0
    }
    
    let s = str[index]
    
    if s == "(" {
        return balancedBrackets(&str, index: index + 1)
    } else if s == ")" {
        if index == 0 {
            return false
        }
        
        if str[index - 1] == "(" {
            str.remove(at: index - 1)
            str.remove(at: index - 1)
        } else {
            return false
        }
    }
    return balancedBrackets(&str, index: index - 1)
}

func balancedBrackets(_ str: String) -> Bool {
    var arr : [Character] = Array(str)
    return balancedBrackets(&arr, index: 0)
}

func testBalancedBrackets(_ str : String, _ expectedResult : Bool) {
    let actualResult = balancedBrackets(str)
    
    if actualResult != expectedResult {
        print("Testing balancedBrackets() with \(str). \nActual result: \(actualResult) does not match the expected result: \(expectedResult)")
    }
}

testBalancedBrackets("", true)
testBalancedBrackets("(((())))", true)
testBalancedBrackets("()", true)
testBalancedBrackets("(())", true)
testBalancedBrackets("()()", true)
testBalancedBrackets("(()()())()", true)
testBalancedBrackets("((()", false)
testBalancedBrackets("()))", false)
testBalancedBrackets(")(", false)
testBalancedBrackets("()((())", false)