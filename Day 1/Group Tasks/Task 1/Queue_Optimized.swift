class Queue {
    var q = [Int]()
    var pointer = -1
    var maxCount = 3

    func poll() -> Int? {
        pointer += 1
        if q.count <= pointer {
            return nil
        }

        if q.count >= maxCount {
            let res = q[pointer]
            q.removeSubrange(0...pointer)

            pointer = -1
            return res
        }
        return q[pointer]
    }

    func push(_ n : Int) {
        q.append(n)
    }
}
// 1, 2, 3  ->
var q = Queue()
q.push(1)
q.push(2)
q.push(3)
if let num = q.poll() {
    print(num)
} else {
    print("Empty queue")
}
if let num = q.poll() {
    print(num)
} else {
    print("Empty queue")
}
if let num = q.poll() {
    print(num)
} else {
    print("Empty queue")
}