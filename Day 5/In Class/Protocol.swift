protocol Serializable {
    func toString() -> String
}

class Person : Serializable {
    var name : String

    init(_ name : String) {
        self.name = name
    }
    
    func toString() -> String {
        return "Hello, \(name)"
    }
}

var p = Person("pesho")
if let s = p as? Serializable {
    print(s.toString())
}

