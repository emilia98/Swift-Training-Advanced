/* Georgi, Emilia, Svetli */
enum MatrixError : Error {
    case multiplyingInvalidArguments
}
class Matrix<T: Numeric> {
    private var m: [T]
    private var rows = 0
    private var columns = 0
    init(_ rows: Int, _ columns: Int) {
        self.rows = rows
        self.columns = columns
        m = Array(repeating: 0, count: rows * columns)
    }
    subscript(_ row: Int, _ column: Int) -> T {
       get {
            var i = row * columns + column
            if row < 0 || row >= rows || column < 0 || column >= columns {
                i = m.count
            }
            return m[i]
       }
       set {
            var i = row * columns + column
            if row < 0 || row >= rows || column < 0 || column >= columns {
                i = m.count
            }
            m[i] = newValue
       }
    }
    func show() {
        for i in 0 ..< rows {
            for j in 0 ..< columns {
                print("\(self[i, j])", terminator: " ")
            }
            print()
        }
    }
    func multiply(_ other: Matrix) throws -> Matrix {
        if columns != other.rows {
            throw MatrixError.multiplyingInvalidArguments
        }
        var res = Matrix<T>(rows, other.columns)
        for i in 0 ..< rows * other.columns {
            for j in 0 ..< columns {
                res.m[i] += m[(i / other.columns) * columns + j] * other.m[(i % rows) + j * other.columns]
            }
        }
        return res
    }
}
var m1 = Matrix<Double>(3, 2)
m1[0, 0] = 7; m1[0, 1] = 8
m1[1, 0] = 9; m1[1, 1] = 10
m1[2, 0] = 11; m1[2, 1] = 12
var m2 = Matrix<Double>(2, 3)
m2[0, 0] = 1; m2[0, 1] = 2; m2[0, 2] = 3
m2[1, 0] = 4; m2[1, 1] = 5; m2[1, 2] = 6
let m = try! m1.multiply(m2)
m.show()