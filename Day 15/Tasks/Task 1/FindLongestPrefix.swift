import Foundation

enum PrefixErrors : String, Error {
    case emptyArrayError = "Array can't be empty!"
}

func findLongestPrefix(_ words : [String]) throws -> String {
    if words.count == 0 {
        throw PrefixErrors.emptyArrayError
    }
    
    var words = words.map { $0.trimmingCharacters(in: .whitespaces) };
    
    var longestPrefix = ""
    
    if words.count == 1 {
        return words[0]
    }
    
    var shortestWordCharsCount = words[0].count
    var shortestWordIndex = 0

    for i in 1 ..< words.count {
        if words[i].count < shortestWordCharsCount {
            shortestWordCharsCount = words[i].count
            shortestWordIndex = i
        }
    }
    
    var currentPrefix = ""
    var shortestPrefix = ""
    let shortestWord = Array(words[shortestWordIndex])
    
    for charIndex in 0 ..< shortestWordCharsCount {
        shortestPrefix = String(shortestWord[0 ... charIndex])
        
        for word in words {
            if word == words[shortestWordIndex] {
                continue
            }
            
            currentPrefix = String(Array(word)[0...charIndex])
            
            if currentPrefix != shortestPrefix {
                currentPrefix = ""
                break
            }
        }
        
        if currentPrefix == "" {
            break
        }
        
        if longestPrefix.count < currentPrefix.count {
            longestPrefix = currentPrefix
        }
    }
    
    return longestPrefix
}

func assert(_ value1: String, _ value2 : String, _ msg : String) {
    if value1 != value2 {
        print(msg)
    }
}

func assertEqualsPrefixError( _ e1 : PrefixErrors, _ e2 : PrefixErrors, _ msg : String) {
    if e1 != e2 {
        print(msg)
    }
}

func testFindLongestPrefix(_ arr : [String], _ expectedResult : String) {
    print("Test findLongestPrefix() with \(arr).")
    
    do {
        let actualResult = try findLongestPrefix(arr)
        let msg = "Actual result: \(actualResult) does not match Expected result: \(expectedResult)."
    
        assert(actualResult, expectedResult, msg)
    } catch {
        print("Error occurred here.")
    }
}

func testFindLongestPrefixWithError(_ arr : [String], _ expectedError: PrefixErrors) {
    print("Test findLongestPrefix() with \(arr).")
    
    do {
        let _ = try findLongestPrefix(arr)
        print("Error \(expectedError.rawValue) wasn't thrown.")
    } catch let error as PrefixErrors {
        let msg = "Actual error: \(error.rawValue) does not match the expected error: \(expectedError.rawValue)."
        assertEqualsPrefixError(error, expectedError, msg)
    } catch {
        print("Other error is thrown.")
    }
}

func testWithValuesWithCommonPrefix() {
    let arr = [ "flower", "flow", "flight" ]
    let expectedResult = "fl"
    
    testFindLongestPrefix(arr, expectedResult)
}

func testWithValuesWithCommonPrefixWithManySpaces() {
    let arr = [ "  flower", " flow", "      flight" ]
    let expectedResult = "fl"
    
    testFindLongestPrefix(arr, expectedResult)
}

func testWithValuesWithNoCommonPrefix() {
    let arr = [ "dog", "racecar", "car" ]
    let expectedResult = ""
    
    testFindLongestPrefix(arr, expectedResult)
}

func testWithValuesWithNoCommonPrefixWithManySpaces() {
    let arr = [ "dog", "racecar", "car" ]
    let expectedResult = ""
    
    testFindLongestPrefix(arr, expectedResult)
}

func testWithOnlySpaces() {
    let arr = [ "     ", "  ", "      " ]
    let expectedResult = ""
    
    testFindLongestPrefix(arr, expectedResult)
}

func testWithOnlySpacesAndSingleCharacter() {
    let arr = [ "     ", "  ", "      a" ]
    let expectedResult = ""
    
    testFindLongestPrefix(arr, expectedResult)
}

func testWithEmptyString() {
    let arr = [ "" ]
    let expectedResult = ""
    
    testFindLongestPrefix(arr, expectedResult)
}

func testWithOneString() {
    let arr = [ "abc" ]
    let expectedResult = "abc"
    
    testFindLongestPrefix(arr, expectedResult)
}

func testWithFullCommonString() {
    let arr = [ "foot", "football", "footballer" ]
    let expectedResult = "foot"
    
    testFindLongestPrefix(arr, expectedResult)
}

func testWithEmptyArray() {
    let arr : [String] = []
    
    testFindLongestPrefixWithError(arr, PrefixErrors.emptyArrayError)
}

testWithValuesWithCommonPrefix()
testWithValuesWithCommonPrefixWithManySpaces()
testWithValuesWithNoCommonPrefix()
testWithValuesWithNoCommonPrefixWithManySpaces()
testWithOnlySpaces()
testWithOnlySpacesAndSingleCharacter()
testWithEmptyString()
testWithOneString()
testWithFullCommonString()
testWithEmptyArray()