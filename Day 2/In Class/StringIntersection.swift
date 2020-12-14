let alphabetSize = 26

func stringIntersection(_ s1 : String, _ s2 : String) -> String {
    var ca = Array(repeating: 0, count: alphabetSize)
    var asciiValueA = Character("a").asciiValue!

    for c in s1 {
        if "a" ... "z" ~= c {
            var i = Int(c.asciiValue! - asciiValueA)
            ca[i] = 1
        }
    }

    for c in s2 {
        var i = Int(c.asciiValue! - asciiValueA)
        if "a" ... "z" ~= c && ca[i] == 1 {
            ca[i] = 2
        }
    }

    var res = ""
    for i in 0 ..< ca.count {
        if ca[i] > 1 {

            var ascii = UInt8(i) + asciiValueA
            res.append(Character(UnicodeScalar(ascii)))
        }
    }

    return res
}

var s1 = "abc"
var s2 = "cdeeeec"

var s = stringIntersection(s1, s2)
print(s)
