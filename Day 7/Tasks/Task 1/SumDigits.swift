func sumDigits( _ x : Int) -> Int{
    if x < 0 {
        return sumDigits(x * -1)
    }
    
    if x < 10 {
        return x
    }
    
    return x % 10 + sumDigits(x / 10)
}

var sum = sumDigits(123)
print(sum)

sum = sumDigits(-12)
print(sum)