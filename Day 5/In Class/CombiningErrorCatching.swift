enum DivideError : Error {
    case divideByZero, negativeArgument
}

func divide(_ x : Int, _ y : Int) throws -> Int {
    if y == 0 {
        throw DivideError.divideByZero
    }
    if y < 0 || x < 0 {
        throw DivideError.negativeArgument
    }

    return x / y
}

/*
var z = divide(5, -5)
if errorStatus == 0 {
    print(z)
} else if errorStatus == -1 {
    print("Cannot divide by zero!")
} else if errorStatus == -2 {
    print("Cannot divide by negative number")
}*/

do {
    var z = try divide(5, -1)
    print("Result: \(z)")
} catch DivideError.divideByZero {
    print("Cannot divide by zero!")
} catch DivideError.negativeArgument {
    print("Cannot divide by negative number")
}







