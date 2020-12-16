func recursive() {
    let x = 1
    print(x)
    recursive()
}

recursive()

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