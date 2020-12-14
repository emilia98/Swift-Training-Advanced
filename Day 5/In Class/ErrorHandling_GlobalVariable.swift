var errorStatus = 0

func divide(_ x : Int, _ y : Int) -> Int {
    if y == 0 {
        errorStatus = -1 // dividing by 0
        return 0
    }
    if y < 0 {
        errorStatus = -2 // negative number passed
        return 0
    }

    errorStatus = 0
    return x / y
}

var z = divide(5, -5)
if errorStatus == 0 {
    print(z)
} else if errorStatus == -1 {
    print("Cannot divide by zero!")
} else if errorStatus == -2 {
    print("Cannot divide by negative number")
}



