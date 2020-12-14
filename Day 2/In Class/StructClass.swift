struct Address {
    var street: String
    var city: String

    func print() {
        Swift.print("Street: \(street)")
        Swift.print("City: \(city)")
    }
}

class Person {
    var age: Int
    private var name: String
    var address: Address

    init(_ age : Int) {
        self.age = age
        name = "Ivan"
        address = Address(street: "Ivan Vazov", city: "Sofia")
    }

    init(_ name : String) {
        self.age = 5
        self.name = name
        address = Address(street: "Ivan Vazov", city: "Sofia")
    }

    func setAge(_ age: Int) {
        if age < 0 {
            Swift.print("Invalid age")
        } else {
            self.age = age
        }
    }

    func print() {
        Swift.print("Age: \(age)")
        Swift.print("Name: \(name)")
        address.print()
        Swift.print("-----")
    }
 }

var a = Person(4)
var b = a
a.setAge(-1)
b.setAge(5)
a.print()
b.print()

b = Person("Pesho")
b.setAge(10)
b.print()