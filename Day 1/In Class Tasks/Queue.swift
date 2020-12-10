class Queue {
    var arr : [Int] = []

    func push(_ num : Int) {
        arr.append(num)
    }

    func poll() -> Int? {
        if arr.count == 0 {
            return nil
        }

        return arr.removeFirst()
    }

    func show() {
        print(arr)
    }
}

var queue = Queue()
queue.push(1)
queue.push(2)
queue.push(3)
if let num = queue.poll() {
    print(num)
}
if let num = queue.poll() {
    print(num)
}
if let num = queue.poll() {
    print(num)
}
if let num = queue.poll() {
    print(num)
} else {
    print("Queue is empty!")
}