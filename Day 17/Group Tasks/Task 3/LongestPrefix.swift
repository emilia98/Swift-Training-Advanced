/* Georgi, Svetli & Emilia */
func longestPrefix(_ a: [String]) -> String {
    if a.isEmpty {
        return ""
    }
    var res = ""
    var f = a[0].startIndex
    for (idx, ch1) in a[0].enumerated() {
        for i in 1 ..< a.count {
            let word = a[i]
            if idx >= word.count {
                return res
            }
            let ch2 = word[f]
            if ch1 != ch2 {
                return res
            }
        }
        res.append(ch1)
        f = a[0].index(after: f)
    }
    return res
}
print(longestPrefix([]))
print(longestPrefix(["flower","flow","flight"]))
print(longestPrefix(["dog","racecar","car"]))