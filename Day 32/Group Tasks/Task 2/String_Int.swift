// Dimitar, Emilia & Svetoslav 

extension Int {
  init?(string: String) {
    if string.isEmpty {
      return nil
    }
    self = 0
    
    let first = string.first!
    let sign : Character? = first == "-" || first == "+" ? first : nil
    var start: String.Index

    if sign != nil {
        let idx = string.firstIndex(of: sign!)
        start = string.index(after: idx!)
    } else {
        start = string.firstIndex(of: first)!
    }
    for el in string[start...]{
        if let toNum = el.wholeNumberValue {
            self *= 10
            self += toNum
        } else {
            return nil
        }
    }
    self = sign == "-" ? self * -1 : self
  }
}

var str = "-12345"
print(Int(string: str))
print(Int(str))
print()
var testStr = ["-12345", "012345", "+12345", "0", "", "- 12345" ]
for s in testStr {
  print(Int(string: s))
  print(Int(s))
}