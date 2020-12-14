func rotate(_ arr : [Int], _ steps : Int) -> [Int]{
    var steps = steps % arr.count

    if (steps == 0) {
        return arr
    }

    var subArr1 = Array(arr[0..<steps])
    var subArr2 = Array(arr[steps..<arr.count])

    subArr1 = reversePart(subArr1)
    subArr2 = reversePart(subArr2)

    return (subArr1 + subArr2).reversed()
}

func reversePart(_ subArr: [Int]) -> [Int] {
    return subArr.reversed()
}

var arr = [1, 2, 3, 4, 5]
var steps = 7
var reversedArr = rotate(arr, steps)
print(reversedArr)


