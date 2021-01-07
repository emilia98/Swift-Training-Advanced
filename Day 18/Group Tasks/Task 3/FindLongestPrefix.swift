/* Georgi, Svetli & Emilia */
func longestPrefix(_ a: [String]) -> String {
    if a.isEmpty {
        return ""
    }
    var res = ""
    var strIdx : [String.Index] = [a[0].startIndex]
    for (idx, ch1) in a[0].enumerated() {
        for i in 1 ..< a.count {
            let word = a[i]
            if strIdx.count < a.count {
                strIdx.append(word.startIndex)
            }
            if idx >= word.count {
                return res
            }
            let ch2 = word[strIdx[i]]
            if ch1 != ch2 {
                return res
            }
            strIdx[i] = a[i].index(after: strIdx[i])
        }
        res.append(ch1)
    }
    return res
}

print(longestPrefix([]))
print(longestPrefix(["flower","flow","flight"]))
print(longestPrefix(["dog","racecar","car"]))
print(longestPrefix(["💩dog","💩racecar","💩car"]))
print(longestPrefix(["word", "💩💩💩", "word"]))
print(longestPrefix(["😎🥳dog","😎🥳racecar","😎🥳car"]))