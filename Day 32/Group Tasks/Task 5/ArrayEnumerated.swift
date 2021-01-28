// Dimitar, Emilia & Svetoslav 

extension Array {
    func numerated() -> AnyIterator<(Int, Element)> {
      var idx : Int = 0

      return AnyIterator<(Int, Element)> {
        if idx == self.count {
          return nil
        }
        defer { 
          idx += 1 
        }
        return (idx, self[idx])
      }
    }
}

var a = [ 1, 2, 3, 4, 5, 6 ]
print(a.numerated())
for (i, v) in a.numerated() {
  print("(\(i), \(v))")
}