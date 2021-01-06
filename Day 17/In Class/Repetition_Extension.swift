extension Int {
    func repetitions(task: () -> Void) {
        for i in 0 ..< self {
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}