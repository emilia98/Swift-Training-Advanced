func multiplyNums(_ n : Int) -> Int {
    if n == 1 || n == 0 {
        return 1
    }
    
    return n * multiplyNums(n - 1)
}

var product = multiplyNums(5)
print(product)