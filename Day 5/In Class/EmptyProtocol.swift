protocol Serializable {
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
print(p.toString())



