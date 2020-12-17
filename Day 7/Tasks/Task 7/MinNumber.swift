func min(_ arr : [Int], _ n : Int) -> Int {
    if n == 1 {
        return arr[n - 1]
    }
    
    let m =  min(arr, n - 1)
    
    return arr[n - 1] < m ? arr[n - 1] : m
}

var arr = [1, 5, -9, 2, 3]
var minElement = min(arr, arr.count)
print(minElement)

arr = [-11, 5, -9, 2, 3]
minElement = min(arr, arr.count)
print(minElement)

arr = [7, 3, 8, 9, 0]
minElement = min(arr, arr.count)
print(minElement)