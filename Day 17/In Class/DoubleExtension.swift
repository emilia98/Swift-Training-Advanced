extension Double {
    var km: Double { self * 1_000.0 }
    var m: Double { self  }
    var cm: Double { self / 100 }
    var mm: Double { self / 1_000.0 }
    var ft: Double { self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet)  meters")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")










