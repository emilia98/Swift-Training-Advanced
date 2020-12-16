// fib(1)
// fib(n) = fib(n - 1) + fib(n - 2)
// 1, 1, 2, 3, 5

func fib(_ n : Int) -> Int {
    if n == 0 || n == 1 {
        return 1
    }
    
    var arr = [1, 1]
    var result = 0
    var x = 2
    
    while x <= n {
        result = arr[x - 1] + arr[x - 2]
        arr.append(result)
        x += 1
    }
    
    return result
}

var res = fib(6) // 13
print(res)

res = fib(5) // 8
print(res)