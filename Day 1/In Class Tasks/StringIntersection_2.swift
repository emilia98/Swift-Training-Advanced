/*
Да се напише функция с параметри два стринга и 
връща стринг, съдържащ общите букви от двата стринга без повторения.
*/
func stringIntersection(_ s1 : String, _ s2 : String) -> String {
    var cs : Set<Character> = []
    
    for c in s1 {
        cs.insert(c)
    }
    
    var res = ""
    
    for c in s2 {
        if cs.contains(c) {
            cs.remove(c)
            res.append(c)
        }
    }
    
    return res
}

var s1 = "abcd"
var s2 = "cde"

var s = stringIntersection(s1, s2)
print(s)