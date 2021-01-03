/* Georgi, Emilia, Svetli */
enum ParserState { case inQuote, noQuote, wasInQuote}

enum ParserError: Error {
    case quoteIsNotClosed(index: Int)
    case stringBeforeQuotes(index: Int)
    case stringAfterQuotes(index: Int)
}

func parseCSV(_ line: String) throws -> [String] {
    var result = [String]()
    var value = ""
    var lastOpenedQuote = -1 
    var parserState: ParserState = .noQuote
    var quote: Character = " "
    for (i, c) in line.enumerated() {
        switch c {
        case ",":
            if parserState == .inQuote {
               value += String(c)
            } else {
                result.append(value)
                value = ""
                parserState = .noQuote
            }
        case "'", "\"":
            if value.last == "\\" {
                lastOpenedQuote = i
                value.removeLast()
                value += String(c)
            } else if parserState == .inQuote {
                if c != quote {
                    value += String(c)
                } else {
                    parserState = .wasInQuote
                }
            } else {
                if value != ""{
                    throw ParserError.stringBeforeQuotes(index: i)
                }
                parserState = .inQuote
                lastOpenedQuote = i + 1
                quote = c
            }
        case "\\":
            if parserState == .wasInQuote {
                throw ParserError.stringAfterQuotes(index: i)
            }
            if value.last != "\\"{
                value += String(c)
            }
        case " ":
            if parserState == .inQuote || (parserState != .wasInQuote && value != "") {
               value += String(c)
            }
        default:
            if parserState == .wasInQuote {
                throw ParserError.stringAfterQuotes(index: i)
            }
            value += String(c)
        }
    }
    result.append(value)
    if parserState == .inQuote{
        throw ParserError.quoteIsNotClosed(index: lastOpenedQuote)
    }
    return result
}

func assertEqualsArrayString(_ s1: [String], _ s2: [String], _ msg: String) {
    if s1 != s2 {
        print(msg)
    }
}

func assertEqualsParserError(_ actualError: ParserError, _ expectedError: ParserError, _ msg: String) {
    switch actualError {
        case .stringBeforeQuotes(let actualIndex):
            switch expectedError {
                case .stringBeforeQuotes(let expectedIndex):
                    if actualIndex == expectedIndex {
                        return
                    }
                default:
                    break
            }
        case .quoteIsNotClosed(let actualIndex):
            switch expectedError {
                case .quoteIsNotClosed(let expectedIndex):
                    if actualIndex == expectedIndex {
                        return
                    }  
                default:
                    break
            }
        case .stringAfterQuotes(let actualIndex):
            switch expectedError {
                case .stringAfterQuotes(let expectedIndex):
                    if actualIndex == expectedIndex {
                        return
                    }  
                default:
                    break
            }
    }
    
    print(msg)
}

func parserCSVCorrectValuesTest(_ str : String, _ expectedResult: [String]) {
    do {
        let actualResult = try parseCSV(str)
        let msg = "Testing parseCSV() with str: \(str). \nActual result: \(actualResult) does not match expected result: \(expectedResult)."
        assertEqualsArrayString(actualResult, expectedResult, msg)
    } catch {
        print("Error \(error) occurred in parseCSV().")
    }
}

func parserCSVError(_ str : String, _ expectedError: ParserError) {
    do {
        let _ = try parseCSV(str)
        print("Expected error \(expectedError) wasn't thrown")
    } catch let error as ParserError {
        let msg = generateErrorMessage(str, error, expectedError)
        assertEqualsParserError(error, expectedError, msg)
    } catch {
        print("A generic errors are thrown!")
    }
}

func generateErrorMessage(_ str: String, _ e1: ParserError, _ e2: ParserError) -> String {
    return "Testing parseCSV() with str: \(str). \nActual error: \(e1) does not match expected error: \(e2)."
}

/* Tests - Correct values */
func testCSVWithSingleAndDoubleQuotes() {
    let str = "\"value1\", abc, value2, \'value3\'"
    let expectedResult = ["value1", "abc", "value2", "value3"]
    parserCSVCorrectValuesTest(str, expectedResult)
}

func testCSVWithSlashes() {
    let str = "\\value1\\, abc, value2, \'val\"ue3\'"
    let expectedResult = ["\\value1\\", "abc", "value2", "val\"ue3"]
    parserCSVCorrectValuesTest(str, expectedResult)
}

func testCSVWithEscapedComma() {
    let str = "\",\", 2, 3, hello"
    let expectedResult = [",", "2", "3", "hello"]
    parserCSVCorrectValuesTest(str, expectedResult)
}

func testCSVWithMultipleSpaces() {
    let str = "   \",\",    2, 3, hello"
    let expectedResult = [",", "2", "3", "hello"]
    parserCSVCorrectValuesTest(str, expectedResult)
}

func testCSVWithSpacesBetweenCharacters() {
    let str = "abc, \"value1\", 2  3, hello"
    let expectedResult = ["abc", "value1", "2  3", "hello"]
    parserCSVCorrectValuesTest(str, expectedResult)
}

func testCSVWithQuotesOnly() {
    let str = "\"\"\'\'"
    let expectedResult = [""]
    parserCSVCorrectValuesTest(str, expectedResult)
}

func testCSVWithEmptyString() {
    let str = ""
    let expectedResult = [""]
    parserCSVCorrectValuesTest(str, expectedResult)
}

/* Tests - Quote is not closed */
func testWithQuoteNotClosedAtTheStart() {
    let str = "\"value1, value2, \'value3\'"
    let expectedError = ParserError.quoteIsNotClosed(index: 1)
    parserCSVError(str, expectedError)
}

func testWithQuoteNotClosedAtTheMiddle() {
    let str = "\"abc\", 2, 3,\"efg"
    let expectedError = ParserError.quoteIsNotClosed(index: 13)
    parserCSVError(str, expectedError)
}

func testWithQuoteNotClosedAtTheEnd() {
    let str = "\",\", 2, 3, \'hello"
    let expectedError = ParserError.quoteIsNotClosed(index: 12)
    parserCSVError(str, expectedError)
}

/* Tests - After Quote Error */
func testWithStringAfterQuotesWithSpace() {
    let str = "\"value1\" abc, value2, \'value3\'"
    let expectedError = ParserError.stringAfterQuotes(index: 9)
    parserCSVError(str, expectedError)
}

func testWithStringAfterQuotesWithOpenQuote() {
    let str = "\"aaa\"dfdf\", 2, 3"
    let expectedError = ParserError.stringAfterQuotes(index: 5)
    parserCSVError(str, expectedError)
}

func testWithStringAfterQuotesWithNoSpace() {
    let str = "\"aaa\"dfdf, 2, 3"
    let expectedError = ParserError.stringAfterQuotes(index: 5)
    parserCSVError(str, expectedError)
}

func testWithStringAfterQuotesWithSlash() {
    let str = "\"aaa\"\\dfdf, 2, 3"
    let expectedError = ParserError.stringAfterQuotes(index: 5)
    parserCSVError(str, expectedError)
}

/* Tests - Before Quote Error */
func testWithBeforeQuotesWithSpace() {
    let str = "abc \"value1\", 2, hello"
    let expectedError = ParserError.stringBeforeQuotes(index: 4)
    parserCSVError(str, expectedError)
}

func testWithBeforeQuotesWithNoSpace() {
    let str = "abc\", 2, 3, hello"
    let expectedError = ParserError.stringBeforeQuotes(index: 3)
    parserCSVError(str, expectedError)
}

func testWithBeforeQuotesWithSingleQuoteBefore() {
    let str = "\"abc\", 2, 3, efg\""
    let expectedError = ParserError.stringBeforeQuotes(index: 16)
    parserCSVError(str, expectedError)
}

func testWithBeforeQuotesWithSpacesAndSingleQuotes() {
    let str = "   \'a\'\",\", 2, 3, hello"
    let expectedError = ParserError.stringBeforeQuotes(index: 6)
    parserCSVError(str, expectedError)
} 

/* Tests - Correct values */
testCSVWithSingleAndDoubleQuotes()
testCSVWithSlashes()
testCSVWithEscapedComma()
testCSVWithMultipleSpaces()
testCSVWithSpacesBetweenCharacters()
testCSVWithQuotesOnly()
testCSVWithEmptyString()

/* Tests - Quote is not closed */
testWithQuoteNotClosedAtTheStart()
testWithQuoteNotClosedAtTheMiddle()
testWithQuoteNotClosedAtTheEnd()

/* Tests - After Quote Error */
testWithStringAfterQuotesWithSpace()
testWithStringAfterQuotesWithOpenQuote()
testWithStringAfterQuotesWithNoSpace()
testWithStringAfterQuotesWithSlash()

/* Tests - Before Quote Error */
testWithBeforeQuotesWithSpace()
testWithBeforeQuotesWithNoSpace()
testWithBeforeQuotesWithSingleQuoteBefore()
testWithBeforeQuotesWithSpacesAndSingleQuotes()
