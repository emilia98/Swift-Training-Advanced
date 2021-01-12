func getKMax (_ arr: [Int], _ k: Int) -> [Int] {
	if k == 0 || arr.count == 0 {
		return []
	}
	
	var arr = arr
	var maxIndex = 0
	let elementsToGet = min(arr.count, k)
	
	for current in 0 ..< elementsToGet {
		var max = arr[current]
		for i in current ..< arr.count {
			if arr[i] > max {
				max = arr[i]
				maxIndex = i
			}
		}
		(arr[current], arr[maxIndex]) = (arr[maxIndex], arr[current])
	}
	
    return Array(arr[0..<elementsToGet])
}

var test = [ 0,4,8,1,6,2 ]
print(getKMax(test, 2))
print(getKMax(test, 3))

test = [8, 9]
print(getKMax(test, 3))