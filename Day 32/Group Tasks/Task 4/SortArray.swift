// Dimitar, Emilia & Svetoslav 

func sort(_ arr: inout [Int]) {
    if arr.count < 2 {
        return
    }

    let (min, max) = findMinMax(arr)
    var count = Array(repeating: 0, count: max - min + 1)

    arr.forEach { count[$0 - min] += 1 }
    var start = 0
    for i in count.indices {
        let end = start + count[i]
        (start ..< end).forEach { arr[$0] = i + min }
        start = end
    }
}

func findMinMax(_ arr : [Int]) -> (Int, Int) {
    var min = arr[0]
    var max = arr[0]

    for el in arr[1..<arr.count] {
      if el < min {
        min = el
      }
      else if el > max {
        max = el
      }
    }

    return (min, max)
}

var arr = [6,3,8,3,2,4,6,3,2,4,6,4,2,1,9,0,-1]
sort(&arr)
print(arr)