let names = [ "Chris", "Alex", "Ewa", "Barry", "Daniella" ]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var compareFunc = backward
var sa = names.sorted(by: compareFunc)
print(sa)