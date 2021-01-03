/* Georgi, Emilia, Svetli */
class Stack<T> {
    var arr: [T] = []
    func push(_ el : T) {
        arr.append(el)
    }
    func pop() -> T? {
        if arr.count == 0 {
            return nil
        }
        return arr.removeLast()
    }
}
var s = Stack<String>()
s.push("one")
s.push("two")
s.push("three")
if let num = s.pop() {
    print(num)
}
if let num = s.pop() {
    print(num)
}
if let num = s.pop() {
    print(num)
}
if let num = s.pop() {
    print(num)
}
if let num = s.pop() {
    print(num)
} else {
    print("Empty Stack!")
}