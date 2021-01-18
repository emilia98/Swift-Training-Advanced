let names = [ "Chris", "Alex", "Ewa", "Barry", "Daniella" ]

/* Anonymous Func
var compareFunc = { (parameters) -> return type in 
    statements
    return
}
*/

var compareFunc = { (s1: String, s2: String) -> Bool in
    return s1 > s2
}

var sa = names.sorted(by: compareFunc)
print(sa)

