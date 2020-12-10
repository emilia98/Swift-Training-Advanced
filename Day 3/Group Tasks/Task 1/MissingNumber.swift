func findMissingNum(_ s: String) -> Int? {
    let maxNumLength = s.count / 2
    
    /*
        We will search for the missing number
        for each digit in range [1, maxNumLength]
    */
    for numLength in 1 ...  maxNumLength {
        if let num = genSeqence(s, numLength: numLength) {
            return num
        }
    }
    return nil
}

func genSeqence(_ s: String, numLength: Int) -> Int? {
    let start = s.prefix(numLength)
    
    guard var num = Int(start) else {
        return nil
    }
    
    // If this is the first valid number from the sequence
    if !isFirstNum(s, num) {
        return nil
    }

    var res: String = String(num)
    
    /*
        We are already sure about this that we've found
        the first num from the sequence, so we continue
        by checking for the missing num in the sequence
    */
    while res.count < s.count {
        num += 1
        res += String(num)
        
        /*
            If the current string, we have formed is not
            the same as the substring we get, we can be
            sure that we've found the missing number,
            so return it
        */
        if res != s.prefix(res.count) {
            return num
        }
    }
    
    // No missing number is  found
    return nil
}

// Check if the given number is the first num from the sequence
func isFirstNum(_ s: String, _ num : Int) -> Bool {
    let consecutive = String(num) + String(num + 1)
    let nonConsecutive = String(num) + String(num + 2)
    
    return consecutive == s.prefix(consecutive.count) || nonConsecutive == s.prefix(nonConsecutive.count)
}

var testStrings = [
    "2526282930", // 27
    "9101213", // 11
    "25272829", // 26
    "10011003", // 1002
    "99910011003", // 1000
    "123456" // No missing number found!
]

for s in testStrings {
    if let missingNumber = findMissingNum(s) {
        print(missingNumber)
    } else {
        print("No missing number found!")
    }
}