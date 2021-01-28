// Dimitar, Emilia & Svetoslav 

infix operator +

func + (a: Int, b: Double) -> Double {
    return Double(a) + b
}
func + (a: Double, b: Int) -> Double {
    return Double(b) + a
}

print(5 + 5.4)