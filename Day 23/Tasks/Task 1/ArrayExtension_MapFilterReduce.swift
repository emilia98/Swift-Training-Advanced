extension Array {
  func customMap(_ customFunc : (Element) -> Element) -> [Element] {
    var resArr = [Element]()
    for x in self {
      resArr.append(customFunc(x))
    }

    return resArr
  }

  func customFilter(_ customFunc: (Element) -> Bool) -> [Element] {
    var resArr = [Element]()

    for x in self {
      if customFunc(x) {
        resArr.append(x)
      }
    }

    return resArr
  }

  func customReduce<Result>(_ initial: Result, _ customFunc: (Result, Element) -> Result) -> Result {
      var initial = initial
      for x in self {
        initial = customFunc(initial, x)
      }

      return initial
  }
}

var arr = [1, 2, 3, 4]
var str = ["a", "b", "c"]

func doubled(_ value : Int) -> Int {
    return value * value
}

func getEven(_ value : Int) -> Bool {
  return value % 2 == 0
}

func sum(_ prevResult: Int, _ value : Int) -> Int  {
  var prevResult = prevResult
  prevResult += value
  return prevResult
}

var mapped = arr.customMap(doubled)
print(mapped)

var mappedString = str.customMap { $0 + "123" }
print(mappedString)

var filterIntArray = arr.customFilter(getEven)
print(filterIntArray)

var filterStringArray = str.customFilter { $0 < "b"}
print(filterStringArray)

var reducedIntArray = arr.customReduce(0, sum)
print(reducedIntArray)

var reducedArray = str.customReduce(["d", "e"]) { $0 + [$1] }
print(reducedArray)