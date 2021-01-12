func getMaxK(_ arr : [Int], _ k : Int) -> [Int] {
    if k == 0 || arr.count == 0 {
        return []
    }
    
    var last = arr[0]
    
    let elementsToGet = min(k, arr.count)
    var a = [Int]()
    a.append(last)
    var lastMin = arr[0]
    
    for i in 1 ..< arr.count {
        last = arr[i]
        
        if a.count < elementsToGet {
            a.append(last)
            a = a.sorted { $0 > $1 }
            lastMin = a[a.count - 1]
            continue
        }
        
        if last > lastMin {
            a[a.count - 1] = last
            a = a.sorted { $0 > $1 }
            lastMin = a[a.count - 1]
        }
    }
    
    return a
}

var arr = [ 10, 1, 7, 8, 9 ]
var k = 3
print(getMaxK(arr, k))

arr = [1, 2, 3, 4]
k = 1
print(getMaxK(arr, k))

arr = [21, 3, 5, 9, 17, 20, 4, 15]
k = 3
print(getMaxK(arr, k))