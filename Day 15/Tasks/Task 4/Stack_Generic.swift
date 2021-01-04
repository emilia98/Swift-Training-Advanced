enum StackErrors : String, Error {
    case popEmptyStack = "Can't pop from empty stack!"
    case peekEmptyStack = "Can't peek from empty stack!"
}

class Stack<T> {
    private var arr: [T] = []
    
    func push(_ num : T) {
        arr.append(num)
    }
    
    func pop() throws -> T {
        if isEmpty() {
            throw StackErrors.popEmptyStack
        }
        return arr.removeLast()
    }
    
    func peek() throws -> T {
        if isEmpty() {
            throw StackErrors.peekEmptyStack
        }
        
        return arr[arr.count - 1]
    }
    
    func isEmpty() -> Bool {
        return arr.count == 0
    }
    
    func show() -> [T] {
        return arr
    }
}

func assert<T: Comparable>(_ value1 : [T], _ value2 : [T], _ msg : String) {
    if value1 != value2 {
        print(msg)
    }
}

func assertBool(_ value1 : Bool, _ value2: Bool, _ msg : String) {
    if value1 != value2 {
        print(msg)
    }
}

func assertStackError(_ e1 : StackErrors, _ e2 : StackErrors, _ msg : String) {
    if e1 != e2 {
        print(msg)
    }
}

func testStackPush<T: Comparable>(_ stack: Stack<T>, _ expectedResult: [T]) {
    let type = T.self
    print("Test Stack Push of type \(type)")
    
    let actualResult = stack.show()
    let msg = "Actual result: \(actualResult) does not match Expected result: \(expectedResult)."
    assert(actualResult, expectedResult, msg)
}

func testStackPop<T: Comparable>(_ stack: Stack<T>, _ expectedResult: [T]) {
    let type = T.self
    print("Test Stack Pop of type \(type)")
    
    do {
        var _ = try stack.pop()
        _ = try stack.pop()
        let actualResult = stack.show()
    
        let msg = "Actual result after pop: \(actualResult) does not match Expected result: \(expectedResult)."
        assert(actualResult, expectedResult, msg)
    } catch {
        print("Error was thrown!")
    }
}

func testStackAfterPop<T: Comparable>(_ stack: Stack<T>, _ expectedResult: [T]) {
    let type = T.self
    print("Test Stack After Pop of type \(type)")
    
    var actualResult = [T]()
    do {
        var x = try stack.pop()
        actualResult.append(x)
        x = try stack.pop()
        actualResult.append(x)
    } catch {
        print("Error was thrown!")
    }
    
    let msg = "Actual result of popped elements: \(actualResult) does not match Expected result of popped elements: \(expectedResult)."
    assert(actualResult, expectedResult, msg)
}

func testPeek<T: Comparable>(_ stack: Stack<T>, _ expectedResult: [T]) {
    let type = T.self
    print("Test Stack Peek of type \(type)")
    
    var actualResult = [T]()
    
    do {
        var x = try stack.peek()
        actualResult.append(x)
        x = try stack.peek()
        actualResult.append(x)
    } catch {
        print("Error was thrown!")
    }
    
    let msg = "Actual result: \(actualResult) does not match Expected result: \(expectedResult)."
    assert(actualResult, expectedResult, msg)
}

func testAfterPeek<T: Comparable>(_ stack: Stack<T>, _ expectedResult: [T]) {
    let type = T.self
    print("Test Stack After Peek of type \(type)")
    
    do {
        var _ = try stack.peek()
        _ = try stack.peek()
    } catch {
        print("Error was thrown!")
    }
    
    let actualResult = stack.show()
    let msg = "Actual result after peek: \(actualResult) does not match Expected result: \(expectedResult)."
    assert(actualResult, expectedResult, msg)
}

func testIsEmpty<T: Comparable>(_ stack: Stack<T>, _ expectedResult: Bool) {
    let type = T.self
    print("Test Stack Is Empty of type \(type)")
    
    do {
        let _ = try stack.pop()
    } catch {
        print("Error was thrown!")
    }
    
    let actualResult: Bool = stack.isEmpty()
    
    let msg = "Actual result isEmpty: \(actualResult) does not match Expected result: \(expectedResult)."
    assertBool(actualResult, expectedResult, msg)
}

func testPopWithEmptyStack<T: Comparable>(_ stack: Stack<T>, _ expectedError: StackErrors) {
    let type = T.self
    print("Test Pop Element Empty Stack of type \(type)")
    
    do {
        let _ = try stack.pop()
    } catch let error as StackErrors {
        let msg = "Actual error: \(error) does not match Expected error: \(expectedError)."
        assertStackError(error, expectedError, msg)
    } catch {
        print("Generic error was thrown!")
    }
}

func testPeekWithEmptyStack<T: Comparable>(_ stack: Stack<T>, _ expectedError: StackErrors) {
    let type = T.self
    print("Test Peek Element Empty Stack of type \(type)")
    
    do {
        let _ = try stack.peek()
    } catch let error as StackErrors {
        let msg = "Actual error: \(error) does not match Expected error: \(expectedError)."
        assertStackError(error, expectedError, msg)
    } catch {
        print("Generic error was thrown!")
    }
}

func testPushWithTypeInt() {
    let stack = Stack<Int>()
    let expectedResult = [ 3, 2 ]
    
    stack.push(3)
    stack.push(2)
    
    testStackPush(stack, expectedResult)
}

func testPushWithTypeDouble() {
    let stack = Stack<Double>()
    let expectedResult = [ 3.25, 2.5 ]
    
    stack.push(3.25)
    stack.push(2.5)
    
    testStackPush(stack, expectedResult)
}

func testPushWithTypeString() {
    let stack = Stack<String>()
    let expectedResult = ["ab", "cd"]
    
    stack.push("ab")
    stack.push("cd")
    
    testStackPush(stack, expectedResult)
}

func testAfterPopWithTypeInt() {
    let stack = Stack<Int>()
    let expectedResult = [ 4 ]
    
    stack.push(4)
    stack.push(3)
    stack.push(2)
    
    testStackPop(stack, expectedResult)
}

func testAfterPopWithTypeDouble() {
    let stack = Stack<Double>()
    let expectedResult = [ 3.25 ]
    
    stack.push(3.25)
    stack.push(2.5)
    stack.push(1.0)
    
    testStackPop(stack, expectedResult)
}

func testAfterPopWithTypeString() {
    let stack = Stack<String>()
    let expectedResult = [ "ab" ]
    
    stack.push("ab")
    stack.push("cd")
    stack.push("ef")
    
    testStackPop(stack, expectedResult)
}

func testPopElementsWithTypeInt() {
    let stack = Stack<Int>()
    let expectedPopElementsResult = [ 2, 3 ]
    
    stack.push(4)
    stack.push(3)
    stack.push(2)
    
    testStackAfterPop(stack, expectedPopElementsResult)
}

func testPopElementsWithTypeDouble() {
    let stack = Stack<Double>()
    let expectedPopElementsResult = [ 1.0, 2.5 ]
    
    stack.push(3.25)
    stack.push(2.5)
    stack.push(1.0)
    
    testStackAfterPop(stack, expectedPopElementsResult)
}

func testPopElementsWithTypeString() {
    let stack = Stack<String>()
    let expectedPopElementsResult = [ "ef", "cd" ]
    
    stack.push("ab")
    stack.push("cd")
    stack.push("ef")
    
    testStackAfterPop(stack, expectedPopElementsResult)
}

func testPeekWithTypeInt() {
    let stack = Stack<Int>()
    let expectedResult = [ 2, 2 ]
    
    stack.push(4)
    stack.push(3)
    stack.push(2)
    
    testPeek(stack, expectedResult)
}

func testPeekWithTypeDouble() {
    let stack = Stack<Double>()
    let expectedResult = [ 1.0, 1.0 ]
    
    stack.push(3.25)
    stack.push(2.5)
    stack.push(1.0)
    
    testPeek(stack, expectedResult)
}

func testPeekWithTypeString() {
    let stack = Stack<String>()
    let expectedResult = [ "ef", "ef" ]
    
    stack.push("ab")
    stack.push("cd")
    stack.push("ef")
    
    testPeek(stack, expectedResult)
}

func testAfterPeekWithTypeInt() {
    let stack = Stack<Int>()
    let expectedResult = [ 4, 3, 2 ]
    
    stack.push(4)
    stack.push(3)
    stack.push(2)
    
    testAfterPeek(stack, expectedResult)
}

func testAfterPeekWithTypeDouble() {
    let stack = Stack<Double>()
    let expectedResult = [ 3.25, 2.5, 1.0 ]
    
    stack.push(3.25)
    stack.push(2.5)
    stack.push(1.0)
    
    testAfterPeek(stack, expectedResult)
}

func testAfterPeekWithTypeString() {
    let stack = Stack<String>()
    let expectedResult = [ "ab", "cd", "ef" ]
    
    stack.push("ab")
    stack.push("cd")
    stack.push("ef")
    
    testAfterPeek(stack, expectedResult)
}

func testIsEmptyWithNotEmptyStack() {
    let stack = Stack<Character>()
    let expectedResult = false
    
    stack.push("a")
    stack.push("b")
    
    testIsEmpty(stack, expectedResult)
}

func testIsEmptyWithEmptyStack() {
    let stack = Stack<Character>()
    let expectedResult = true
    
    stack.push("a")
    
    testIsEmpty(stack, expectedResult)
}

func testPopWithEmptyStack() {
    let stack = Stack<Character>()
    let expectedError = StackErrors.popEmptyStack
    
    testPopWithEmptyStack(stack, expectedError)
}

func testPeekWithEmptyStack() {
    let stack = Stack<Character>()
    let expectedError = StackErrors.peekEmptyStack
    
    testPeekWithEmptyStack(stack, expectedError)
}

testPushWithTypeInt()
testPushWithTypeDouble()
testPushWithTypeString()
testAfterPopWithTypeInt()
testAfterPopWithTypeDouble()
testAfterPopWithTypeString()
testPopElementsWithTypeInt()
testPopElementsWithTypeDouble()
testPopElementsWithTypeString()
testPeekWithTypeInt()
testPeekWithTypeDouble()
testPeekWithTypeString()
testAfterPeekWithTypeInt()
testAfterPeekWithTypeDouble()
testAfterPeekWithTypeString()
testIsEmptyWithNotEmptyStack()
testIsEmptyWithEmptyStack()
testPopWithEmptyStack()
testPeekWithEmptyStack()