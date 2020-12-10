/*
Да се напише функция с параметри два стринга и 
връща стринг, съдържащ общите букви от двата стринга без повторения.
*/
func stringIntersection(_ s1 : String, _ s2 : String) -> String {
    var cs1 : Set<Character> = []
    var cs2 : Set<Character> = []
    
    for c in s1 {
        cs1.insert(c)
    }
    
    for c in s2 {
        cs2.insert(c)
    }
    
    let cs = cs1.intersection(cs2)
    var res = ""
    
    for c in cs {
        res.append(c)
    }
    
    return res
}

var s1 = "abcd"
var s2 = "cde"

var s = stringIntersection(s1, s2)
print(s)