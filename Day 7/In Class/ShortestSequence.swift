func shortestSequence(_ a : [Int], _ nums: [Int]) -> [Int] {
    var ns = Set(nums)
    var nd = Dictionary<Int, Int>()
    var cs = (start: -1, end: -1) // current sequence
    var ms = (start: -1, end: -1) // min sequence

    for (i, v) in a.enumerated() {
        if ns.contains(v) {
            nd[v] = i
            if nd.count == 1 {
                cs.start = i
            }
            else if nd.count == ns.count {
                cs.end = i // end of sequence
                var first = a[cs.start]
                nd[first] = nil

                if ms.start == -1 || cs.end - cs.start < ms.end - ms.start {
                    ms = cs
                    cs.start = i
                }
            }
        }
    }

    return ms.start < 0 ? [] : Array(a[ms.start ... ms.end])
}

var arr = [1, 3, 8, 4, 2, 8, 2, 11 ,1, 5, 13]
var nums = [1, 4, 8]

var sh = shortestSequence(arr, nums)
print(sh)