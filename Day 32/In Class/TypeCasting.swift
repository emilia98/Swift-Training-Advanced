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

func tellToHush(_ d: Dog) {
    // d.beQuiet();
    // (d as! NoisyDog).beQuite() // cast
    // 

    // Type Check
    if d is NoisyDog {
        var d = d as! NoisyDog
        d.beQuiet()
    }

    print()

    // Type Check
    if let d = d as? NoisyDog {
        d.beQuiet()
    }
}

let nd = NoisyDog()
tellToHush(nd)

let d = Dog()
tellToHush(d)
