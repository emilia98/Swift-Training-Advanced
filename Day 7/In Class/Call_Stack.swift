func add(_ a : Int, _ b : Int) -> Int {
    let y = a + b
    return y
}

func average(_ a : Int, _ b : Int) -> Int {
    let c = add(a, b) / 2
    return c
}

func main() {
    let x = average(10, 20)
    print(x)
}

main()

// Step 1
-> add
    a: Int (8 bytes)
    b: Int (8 bytes)
    y: Int (8 bytes)
-> average
    a: Int (8 bytes)
    b: Int (8 bytes)
    c: Int (8 bytes)
-> main
    x: Int 8 bytes

// Step 2
-> average
    a: Int (8 bytes)
    b: Int (8 bytes)
    c: Int (8 bytes)
-> main
    x: Int 8 bytes

// Step 3
-> print
    x: Int
-> main
    x: Int 8 bytes

// Step 4
-> main
    x: Int 8 bytes

// Step 5
// (nothing left in the call  stack)






