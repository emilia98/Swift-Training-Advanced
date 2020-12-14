let alphabetSize = 26

func stringIntersection(_ s1 : String, _ s2 : String) -> String {
    var charArray1 = Array(repeating: false, count: alphabetSize)
    var charArray2 = Array(repeating: false, count: alphabetSize)
    var asciiValueA = Character("a").asciiValue!

    for c in s1 {
        if "a" ... "z" ~= c {
            var i = Int(c.asciiValue! - asciiValueA)
            charArray1[i] = true
        }
    }

    for c in s2 {
        var i = Int(c.asciiValue! - asciiValueA)
        if "a" ... "z" ~= c {
            charArray2[i] = true
        }
    }

    var res = ""
    for i in 0 ..< alphabetSize {
        if charArray1[i] && charArray2[i] {
            var ascii = UInt8(i) + asciiValueA
            res.append(Character(UnicodeScalar(ascii)))
        }
    }

    return res
}

var s1 = "abc"
var s2 = "cdeeeeca"

var s = stringIntersection(s1, s2)
print(s)
