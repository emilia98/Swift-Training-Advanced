struct Vector2D {
    var x = 0.0, y = 0.0
}

infix operator +-: AdditionPrecedence

extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

let vector = Vector2D(x : 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
var plusMinusVector = vector +- anotherVector
print(plusMinusVector)




