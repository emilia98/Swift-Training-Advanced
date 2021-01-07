/* Georgi, Svetli & Emilia */
enum ParserState { case inQuote, noQuote, wasInQuote}

enum ParserErrorDescription : String {
    case quoteIsNotClosed = "Quote is not closed!"
    case stringBeforeQuotes = "String before quotes!"
    case stringAfterQuotes = "String after quotes!"
}

enum ParserError: Error {
    case quoteIsNotClosed(index: Int)
    case stringBeforeQuotes(index: Int)
    case stringAfterQuotes(index: Int)
    
    private static func extractError(_ err : ParserError) -> (type: ParserErrorDescription, index: Int) {
        var errType : ParserErrorDescription = .quoteIsNotClosed
        var errIndex = -1
        
        if case .quoteIsNotClosed(let index) = err {
            errType = ParserErrorDescription.quoteIsNotClosed
            errIndex = index
        } else if case .stringBeforeQuotes(let index) = err {
            errType = ParserErrorDescription.stringBeforeQuotes
            errIndex = index
        } else if case .stringAfterQuotes(let index) = err {
            errType = ParserErrorDescription.stringAfterQuotes
            errIndex = index
        }
        
        return (type: errType, index: errIndex)
    }
   
    static func !=(_ first: ParserError,_ second: ParserError) -> Bool {
        return extractError(first) != extractError(second)
    }
}

func parseCSV(_ line: String) throws -> [String] {
    var result = [String]()
    var value = ""
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
                    throw ParserError.stringBeforeQuotes(index: i - 1)
                }
                parserState = .inQuote
                quote = c
            }
        case "\\":
            if parserState == .wasInQuote {
                throw ParserError.stringAfterQuotes(index: i - 1)
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
                throw ParserError.stringAfterQuotes(index: i - 1)
            }
            value += String(c)
        }
    }
    result.append(value)
    
    if parserState == .inQuote{
        throw ParserError.quoteIsNotClosed(index: line.count - 1)
    }
    return result
}

extension String {
    func repeating(_ times: Int) -> String{
        var temp = ""
        for _ in 0 ..< times {
            temp += self
        }
        return temp
    }
    
    func format() {
        let repeated = "-".repeating(12)
        print("\(repeated) \(self) \(repeated)")
    }
}

func demo() {
    func representError(_ str : String, _ index : Int) {
        let errorPointer = "-".repeating(index) + "^"
        print(str)
        print(errorPointer)
    }

    func demoParseCSV(_ str : String) {
        do {
            let result = try parseCSV(str)
            print("Result: \(result)\n")
        } catch let error as ParserError {
            if case .quoteIsNotClosed(let index) = error {
                print("Error: \(ParserErrorDescription.quoteIsNotClosed.rawValue)")
                representError(str, index)
            } else if case .stringBeforeQuotes(let index) = error {
                print("Error: \(ParserErrorDescription.stringBeforeQuotes.rawValue)")
                representError(str, index)
            } else if case .stringAfterQuotes(let index) = error {
                print("Error: \(ParserErrorDescription.stringAfterQuotes.rawValue)")
                representError(str, index)
            }
        } catch {
            print("Other error!")
        }
    }
    
    demoParseCSV("\"value1\", abc, value2, \'value3\'")
    demoParseCSV("\"value1, value2, \'value3\'")
    demoParseCSV("\"value1\"abc, value2, \'value3\'")
    demoParseCSV("abc\"value1\", 2, hello")
}

"DEMO".format()
// print("\("-".repeating(12)) DEMO \("-".repeating(12))")
demo()

func test() {
    func assertEqualsArrayString(_ s1: [String], _ s2: [String], _ msg: String) {
        if s1 != s2 {
            print(msg)
        }
    }

    func assertEqualsParserError(_ actualError: ParserError, _ expectedError: ParserError, _ msg: String) {
        if actualError != expectedError {
            print(msg)
        }
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
        let expectedError = ParserError.quoteIsNotClosed(index: 24)
        parserCSVError(str, expectedError)
    }
    
    func testWithQuoteNotClosedAtTheMiddle() {
        let str = "\"abc\", 2, 3,\"efg"
        let expectedError = ParserError.quoteIsNotClosed(index: 15)
        parserCSVError(str, expectedError)
    }
    
    func testWithQuoteNotClosedAtTheEnd() {
        let str = "\",\", 2, 3, \'hello"
        let expectedError = ParserError.quoteIsNotClosed(index: 16)
        parserCSVError(str, expectedError)
    }
    
    /* Tests - After Quote Error */
    func testWithStringAfterQuotesWithSpace() {
        let str = "\"value1\" abc, value2, \'value3\'"
        let expectedError = ParserError.stringAfterQuotes(index: 8)
        parserCSVError(str, expectedError)
    }
    
    func testWithStringAfterQuotesWithOpenQuote() {
        let str = "\"aaa\"dfdf\", 2, 3"
        let expectedError = ParserError.stringAfterQuotes(index: 4)
        parserCSVError(str, expectedError)
    }
    
    func testWithStringAfterQuotesWithNoSpace() {
        let str = "\"aaa\"dfdf, 2, 3"
        let expectedError = ParserError.stringAfterQuotes(index: 4)
        parserCSVError(str, expectedError)
    }
    
    func testWithStringAfterQuotesWithSlash() {
        let str = "\"aaa\"\\dfdf, 2, 3"
        let expectedError = ParserError.stringAfterQuotes(index: 4)
        parserCSVError(str, expectedError)
    }
    
    /* Tests - Before Quote Error */
    func testWithBeforeQuotesWithSpace() {
        let str = "abc \"value1\", 2, hello"
        let expectedError = ParserError.stringBeforeQuotes(index: 3)
        parserCSVError(str, expectedError)
    }
    
    func testWithBeforeQuotesWithNoSpace() {
        let str = "abc\", 2, 3, hello"
        let expectedError = ParserError.stringBeforeQuotes(index: 2)
        parserCSVError(str, expectedError)
    }
    
    func testWithBeforeQuotesWithSingleQuoteBefore() {
        let str = "\"abc\", 2, 3, efg\""
        let expectedError = ParserError.stringBeforeQuotes(index: 15)
        parserCSVError(str, expectedError)
    }
    
    func testWithBeforeQuotesWithSpacesAndSingleQuotes() {
        let str = "   \'a\'\",\", 2, 3, hello"
        let expectedError = ParserError.stringBeforeQuotes(index: 5)
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
}

"TESTS".format()
// print("\("-".repeating(12)) TESTS \("-".repeating(12))")
test()