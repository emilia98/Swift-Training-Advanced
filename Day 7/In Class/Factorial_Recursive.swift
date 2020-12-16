// n! = n * (n - 1)!
// n(1) = 1


func fact(_ n : Int) -> Int {
    if n < 1 {
        return 1
    }
    
    return n * fact(n - 1)
}

var f = fact(5)
print(f)