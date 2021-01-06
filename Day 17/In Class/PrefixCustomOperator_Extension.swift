struct Vector2D {
    var x = 0.0, y = 0.0
}

prefix operator +++

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }

    static func += (left : inout Vector2D, right: Vector2D) {
        left = left + right
    }
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var vector = Vector2D(x: 1.0, y: 4.0)
let doubleVector = +++vector
print(doubleVector)