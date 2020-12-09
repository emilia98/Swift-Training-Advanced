func unite(_ firstArr : [Int], _ secondArr : [Int]) -> [Int] {
    var unitedArr = [Int]()
    let firstCount = firstArr.count
    let secondCount = secondArr.count
    
    let minCount = firstCount < secondCount ? firstCount : secondCount
    
    for i in 0..<minCount {
        unitedArr.append(firstArr[i])
        unitedArr.append(secondArr[i])
    }
    
    if firstCount >= secondCount {
        unitedArr.append(contentsOf: firstArr[minCount..<firstCount])
    } else {
        unitedArr.append(contentsOf: secondArr[minCount..<secondCount])
    }
    
    return unitedArr
}

var newArr = unite([1, 3, 5], [2, 4, 6]) // [1, 2, 3, 4, 5, 6]
print(newArr)

newArr = unite([1, 3], [2, 4, 5, 6, 7]) // [1, 2, 3, 4, 5, 6, 7]
print(newArr)

newArr = unite([1, 3, 5, 6, 10], [2, 4]) // [1, 2, 3, 4, 5, 6, 10]
print(newArr)
