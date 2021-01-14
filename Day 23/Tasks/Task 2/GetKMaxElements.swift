func getKMax(_ arr : [Int], _ k : Int) -> [Int] {
    if k <= 0 || arr.count == 0 {
        return []
    }
    
    var arr = arr
    var index = 1
    var prev = arr[0]
    var current: Int
    var lastSwapped: Int? = nil
    let elementsToGet = min(k, arr.count)
    
    while index < arr.count {
        current = arr[index]
        
        if prev < current {
            if lastSwapped == nil {
                lastSwapped = index
            }
            
            (arr[index - 1], arr[index]) = (arr[index], arr[index - 1])
            index -= 1
            
            if index == 0 {
                index = 1
            }
            prev = arr[index - 1]
        }
        else {
            if let _ = lastSwapped {
                lastSwapped = nil
            }
            index += 1
            prev = current
        }
    }
    
    return Array(arr[0..<elementsToGet])
}

var arr = [10, 1, 7, 9, 8, 0, 12]
var k = 3
var res = getKMax(arr, k)
print(res)

arr = [1, 2, 3, 4]
k = 2
res = getKMax(arr, k)
print(res)

arr = [5, 3, 3, 5, 6, 7]
k = 5
res = getKMax(arr, k)
print(res)

arr = [1]
k = 2
res = getKMax(arr, k)
print(res)

arr = [1, 2, 3, 3, 3, 6, 6, 8, 9]
k = 5
res = getKMax(arr, k)
print(res)

arr = [0, 4, 6, 1, 8, 2]
k = 2
res = getKMax(arr, k)
print(res)