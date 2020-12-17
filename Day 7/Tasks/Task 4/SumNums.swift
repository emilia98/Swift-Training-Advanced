func sumNums(_ n : Int) -> Int {
    if n == 1 {
        return n
    }
    
    return n + sumNums(n - 1)
}

var sum = sumNums(10)
print(sum)