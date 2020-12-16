func recursive(_ x : Int) {
    print(x)
    if x == 1 {
        return
    }
   
    recursive(x - 1)
}

recursive(5)

/*
recursive
    x: Int 8 bytes
recursive
    x: Int 8 bytes
recursive
    x: Int 8 bytes
recursive
    x: Int 8 bytes
recursive
    x: Int 8 bytes
recursive
    x: Int 8 bytes
*/