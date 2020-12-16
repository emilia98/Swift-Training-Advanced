// n! = n * (n - 1)!
// n(1) = 1

func fact(_ n : Int) -> Int {
    var res = 1
    
    for i in 1 ... n {
        res = res * i
    }
    
    return res
}

var f = fact(5)
print(f)