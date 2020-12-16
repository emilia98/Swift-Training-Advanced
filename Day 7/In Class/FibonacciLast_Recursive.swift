// fib(1)
// fib(n) = fib(n - 1) + fib(n - 2)
// 1, 1, 2, 3, 5

func fib(_ n : Int) -> Int {
    if n == 1 || n == 0 {
        return 1
    }
    
    return fib(n - 1) + fib(n - 2)
}

var res = fib(6)
print(res)

res = fib(5)
print(res)