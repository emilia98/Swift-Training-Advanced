var arr = [Int]()

func push(_ num : Int) {
   arr.append(num)
}

func pop() -> Int? {
    if arr.count == 0 {
        return nil
    }
    return arr.removeLast()
}

push(1)
push(2)  
push(3) 
if let num = pop() {
    print(num)
}
if let num = pop() {
    print(num)
}
if let num = pop() {
    print(num)
}
if let num = pop() {
    print(num)
} else {
    print("Stack is empty!")
}
