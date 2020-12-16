// fib(1)
// fib(n) = fib(n - 1) + fib(n - 2)
// 1, 1, 2, 3, 5

func fib(_ n : Int) -> Int {
    if n == 0 || n == 1 {
        return 1
    }
    
    var prev = 1
    var current = 1
    var res = 0
    
    for _ in 2 ... n {
        res = current + prev
        prev = current
        current = res
    }
    
    return current
}

var res = fib(6) // 13
print(res)

res = fib(5) // 8
print(res)

res = fib(0) // 1
print(res)

res = fib(1) // 1
print(res)