enum MissingNumErrors : String, Error {
    case emptyArray = "Can't find missing number in empty array!"
    case oneElementArray = "Can't find missing number in array with only one element!"
}

func findMissingNumber(_ arr : [Int]) throws -> Int {
    if arr.count == 0 {
        throw MissingNumErrors.emptyArray
    }
    
    if arr.count == 1 {
        throw MissingNumErrors.oneElementArray
    }
    
    let nums = Set<Int>(arr)
    var minMissing = Int.max
    
    for num in arr {
        let nextMissing = num + 1
        
        if !nums.contains(nextMissing) {
            if nextMissing < minMissing {
                minMissing = nextMissing
            }
        }
    }
    
    return minMissing
}

func assert(_ value1 : Int, _ value2 : Int, _ msg : String) {
    if value1 != value2 {
        print(msg)
    }
}

func assertMissingNumError(_ e1 : MissingNumErrors, _ e2 : MissingNumErrors, _ msg : String) {
    if e1 != e2 {
        print(msg)
    }
}

func testWithCorrectValues(_ arr : [Int], _ expectedResult: Int) {
    print("Test findMissingNumber() with \(arr).")
    
    do {
        let actualResult = try findMissingNumber(arr)
        let msg = "Actual result: \(actualResult) does not match Expected result: \(expectedResult)."
        assert(actualResult, expectedResult, msg)
    } catch {
        print("Error occurred!")
    }
}

func testWithErrors(_ arr : [Int], _ expectedError : MissingNumErrors) {
    print("Test findMissingNumber() with \(arr).")
    
    do {
        let _ = try findMissingNumber(arr)
        print("Error \(expectedError.rawValue) wasn't thrown.")
    } catch let error as MissingNumErrors {
        let msg = "Actual error: \(error.rawValue) does not match Expected error: \(expectedError.rawValue)."
        assertMissingNumError(error, expectedError, msg)
    } catch {
        print("Generic error occurred!")
    }
}

func testFindMissingNumberWithMoreThanOneMissingNumberInTheMiddle() {
    let arr = [ 3, 4, -1, 1 ]
    let expectedResult = 0
    
    testWithCorrectValues(arr, expectedResult)
}

func testFindMissingNumberWithMissingNumberBiggerThanSmallestElement() {
    let arr = [ 1, 2, 0 ]
    let expectedResult = 3
    
    testWithCorrectValues(arr, expectedResult)
}

func testFindMissingNumberWithOneMissingNumberInTheMiddle() {
    let arr = [ 7, 8, 9, 11, 12 ]
    let expectedResult = 10
    
    testWithCorrectValues(arr, expectedResult)
}

func testFindMissingNumberWithOneMissingNumberWithAllEqualElements() {
    let arr = [ -1, -1, -1 ]
    let expectedResult = 0
    
    testWithCorrectValues(arr, expectedResult)
}

func testFindMissingNumberWithEmptyArray() {
    let arr: [Int] = []
    let expectedError = MissingNumErrors.emptyArray
    
    testWithErrors(arr, expectedError)
}

func testFindMissingNumberWithOneElementArray() {
    let arr = [ -1 ]
    let expectedError = MissingNumErrors.oneElementArray
    
    testWithErrors(arr, expectedError)
}

testFindMissingNumberWithMoreThanOneMissingNumberInTheMiddle()
testFindMissingNumberWithMissingNumberBiggerThanSmallestElement()
testFindMissingNumberWithOneMissingNumberInTheMiddle()
testFindMissingNumberWithOneMissingNumberWithAllEqualElements()
testFindMissingNumberWithEmptyArray()
testFindMissingNumberWithOneElementArray()