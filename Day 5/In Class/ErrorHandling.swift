enum DivideError :  String, Error {
    case divideByZero = "Cannot divide by zero!"
    case  negativeArgument = "Cannot divide by negative number"
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

do {
    var z = try divide(5, -1)
    print("Result: \(z)")
} catch let error as DivideError {
    print(error.rawValue)
}
