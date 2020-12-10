/*
Да се напише функция с параметри два стринга и 
връща стринг, съдържащ общите букви от двата стринга без повторения.
*/
func stringIntersection(_ s1 : String, _ s2 : String) -> String {
    let cs1 = Set(s1), cs2 = Set(s2)
    let cs = cs1.intersection(cs2)
    return String(cs)
}

var s1 = "abcd"
var s2 = "cddeeeec"

var s = stringIntersection(s1, s2)
print(s)