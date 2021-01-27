class Dog {
    func bark() {
        print("woof")
    }
}

class NoisyDog : Dog {
    override func bark() {
        super.bark()
        super.bark()
    }

    func beQuiet() {
        self.bark()
    }
}

// Optional Chaining 
func tellToHush(_ d: Dog) {
    let d = d as? NoisyDog
    d?.beQuiet()
    print()
    (d as? NoisyDog)?.beQuiet()
}

let nd = NoisyDog()
tellToHush(nd)

let d = Dog()
tellToHush(d)