func recursive2(_ x : Int) {
    print(x, "rescursive2")
    if x == 1 {
        return
    }
   
    recursive1(x - 1)
}

func recursive1(_ x : Int) {
    print(x, "rescursive1")
    if x == 1 {
        return
    }
   
    recursive2(x - 1)
}

recursive1(5)