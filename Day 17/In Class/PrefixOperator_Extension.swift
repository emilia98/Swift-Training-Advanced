struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }

    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }

    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

let vector = Vector2D(x : 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

print(combinedVector)
combinedVector += vector
print(combinedVector)

let minusVector = -vector
print(minusVector)






