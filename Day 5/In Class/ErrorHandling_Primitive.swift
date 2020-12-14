func divide(_ x : Int, _ y : Int) -> Int {
    if y == 0 {
        return -1 // dividing by 0
    }
    if y < 0 {
        return -2 // negative number passed
    }
    return x / y
}

var z = divide(5, 0)
if z >= 0 {
    print(z)
} else if z == -1 {
    print("Cannot divide by zero!")
} else if z == -2 {
    print("Cannot divide by negative number")
}



