/* Daniela, Dimitar & Emilia */

extension Array {
	func _map(_ f: (Element) -> Element) -> [Element] {
		var res = [Element]()
		for el in self {
			res.append(f(el))
		}
		return res
	}

	func _filter(_ f: (Element) -> Bool) -> [Element] {
		var res = [Element]()
		for el in self {
			if f(el){
				res.append(el)
			}
		}
		return res
	}

	func _reduce<Result>(_ res: Result, _ f: (Result, Element) -> Result) -> Result {
    var res = res
		for el in self {
			res = f(res,el)
		}	
    return res	
	}
}

let arr = [0, 1, 5, 9, 6, 7]

let resMap = arr._map { $0 + 2 }
print(resMap)

let resFilter = arr._filter { $0 < 6 }
print(resFilter)

let resReduce = arr._reduce([5,6,7]) { $0 + [$1 * 2] }
print(resReduce)
