func countZeroes(_ arr : [Int], _ n : Int) -> Int {
    if n == 0 {
        return 0
    }
    
    if arr[n - 1] == 0 {
        return 1 + countZeroes(arr, n - 1)
    }
    
    return countZeroes(arr, n - 1)
}

var arr = [0, 5, 6, 0, 1, 2, 0]
var zeroes = countZeroes(arr, arr.count)
print(zeroes)

arr = [1, 2, 3, 4, 5]
zeroes = countZeroes(arr, arr.count)
print(zeroes)