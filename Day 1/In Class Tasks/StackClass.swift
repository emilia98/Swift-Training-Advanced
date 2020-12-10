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
}

var stack = Stack()
stack.push(1)
stack.push(2)  
stack.push(3) 
if let num = stack.pop() {
    print(num)
}
if let num = stack.pop() {
    print(num)
}
if let num = stack.pop() {
    print(num)
}
if let num = stack.pop() {
    print(num)
} else {
    print("Stack is empty!")
}
