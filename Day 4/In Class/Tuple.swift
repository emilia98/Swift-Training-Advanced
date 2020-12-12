var a = (min: 1, max: 2)
print(a)

func minMax(_ a : [Int]) -> (min: Int, max: Int) {
    (0, 1)
}

var b = minMax([])
var (min, max) = b
print(min, max)
