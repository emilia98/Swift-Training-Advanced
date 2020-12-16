// n! = n * (n - 1)!
// n(1) = 1
// n >= 0

enum FactError : Error {
    case negativeArgument
}

func fact(_ n : Int) throws -> Int {
    if n < 0 {
        throw FactError.negativeArgument
    }
    
    if n <= 1 {
        return 1
    }
    
    return n * (try fact(n - 1))
}

do {
    var f = try fact(5)
    print(f)

    f = try fact(0)
    print(f)

    f = try fact(-1)
    print(f)
} catch {
    print(error)
}
