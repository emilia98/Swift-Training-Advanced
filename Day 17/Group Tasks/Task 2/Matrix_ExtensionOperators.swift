/* Georgi, Svetli & Emilia */
prefix operator ⤢
prefix operator ⟳

class Matrix<T> {
    internal var m: [T] = []
    internal var rows = 0
    internal var columns = 0
    internal var defaultValue : T
    
    init(rows: Int, columns: Int, defaultValue: T) {
        self.rows = rows
        self.columns = columns
        self.defaultValue = defaultValue
        self.m = Array<T>(repeating: defaultValue, count: rows * columns)
    }
    
    internal init(rows: Int, columns: Int, defaultValue: T, arr: [T]) {
        if arr.count != rows * columns {
        }
        self.rows = rows
        self.columns = columns
        self.defaultValue = defaultValue
        self.m = arr
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
        print("-----")
    }
    
    static prefix func ⟳(_ matrix: Matrix) {
        let mtx = Matrix<T>(rows: matrix.columns, columns: matrix.rows, defaultValue: matrix.defaultValue)
        for i in 0 ..< matrix.rows {
            for j in 0 ..< matrix.columns {
                mtx[j, matrix.rows - i - 1] = matrix[i, j]
            }
        }
        matrix.m = mtx.m
        (matrix.rows, matrix.columns) = (matrix.columns, matrix.rows)
    }
    
    static prefix func ⤢(_ matrix: Matrix) {
        let mtx = Matrix<T>(rows: matrix.columns, columns: matrix.rows, defaultValue: matrix.defaultValue)
        for i in 0 ..< matrix.rows {
            for j in 0 ..< matrix.columns {
                mtx[j, i] = matrix[i, j]
            }
        }
        matrix.m = mtx.m
        (matrix.rows, matrix.columns) = (matrix.columns, matrix.rows)
    }
}

enum MatrixError : String, Error {
    case multiplyingInvalidArguments = "Multiplying invalid arguments!"
    case invalidMatrixDimensions = "Invalid matrix dimensions!"
}

class NumMatrix<T: Numeric>: Matrix<T> {
    init(rows: Int, columns: Int){
        super.init(rows: rows, columns: columns, defaultValue: 0)
    }
    
    private init(rows: Int, columns: Int, arr: [T]){
        super.init(rows: rows, columns: columns, defaultValue: 0, arr: arr)
    }
    
    static func *(_ left: NumMatrix, _ right: NumMatrix) throws -> NumMatrix {
        if left.columns != right.rows {
            throw MatrixError.multiplyingInvalidArguments
        }
        let res = NumMatrix<T>(rows: left.rows, columns: right.columns)
        for i in 0 ..< left.rows * right.columns {
            for j in 0 ..< left.columns {
                res.m[i] += left.m[(i / right.columns) * left.columns + j] * right.m[(i % left.rows) + j * right.columns]
            }
        }
        return res
    }
    
    static func *(_ matrix: NumMatrix, n: T) -> NumMatrix {
        return multiply(n, matrix)
    }
    
    static func *(n: T, _ matrix: NumMatrix) -> NumMatrix {
        return multiply(n, matrix)
    }
    
    private static func multiply(_ n : T, _ matrix : NumMatrix) -> NumMatrix {
        let res = NumMatrix<T>(rows: matrix.rows, columns: matrix.columns)
        for i in 0 ..< res.m.count {
            res.m[i] = matrix.m[i] * n
        }
        return res
    }
    
    static func +(_ left: NumMatrix, _ right: NumMatrix) throws -> NumMatrix {
        if left.rows != right.rows || left.columns != right.columns {
            throw MatrixError.invalidMatrixDimensions
        }
        var resArr = [T]()
        resArr.reserveCapacity(left.m.count)
        for i in 0 ..< left.m.count {
            resArr.append(left.m[i] + right.m[i])
        }
        return NumMatrix<T>(rows: left.rows, columns: left.columns, arr: resArr)
    }
    
    static func -(_ left: NumMatrix, _ right: NumMatrix) throws -> NumMatrix {
        if left.rows != right.rows || left.columns != right.columns {
            throw MatrixError.invalidMatrixDimensions
        }
        var resArr = [T]()
        resArr.reserveCapacity(left.m.count)
        for i in 0 ..< left.m.count {
            resArr.append(left.m[i] - right.m[i])
        }
        return NumMatrix<T>(rows: left.rows, columns: left.columns, arr: resArr)
    }
}

var m1 = NumMatrix<Int>(rows: 3, columns: 2)
m1[0, 0] = 7; m1[0, 1] = 8
m1[1, 0] = 9; m1[1, 1] = 10
m1[2, 0] = 11; m1[2, 1] = 12
m1.show()
 
var m2 = NumMatrix<Int>(rows: 2, columns: 3)
m2[0, 0] = 1; m2[0, 1] = 2; m2[0, 2] = 3
m2[1, 0] = 4; m2[1, 1] = 5; m2[1, 2] = 6
m2.show()
 
var m3 = Matrix<String>(rows: 3, columns: 3, defaultValue: "")
m3[0, 0] = "a"; m3[0, 1] = "b"; m3[0, 2] = "c";
m3[1, 0] = "d"; m3[1, 1] = "e"; m3[1, 2] = "f";
m3[2, 0] = "g"; m3[2, 1] = "h"; m3[2, 2] = "i";
m3.show()
 
var m4 = Matrix<Character>(rows: 3, columns: 2, defaultValue: "\0")
m4[0, 0] = "a"; m4[0, 1] = "b"; 
m4[1, 0] = "c"; m4[1, 1] = "d";
m4[2, 0] = "e"; m4[2, 1] = "f";
m4.show()
 
var m5 = NumMatrix<Int>(rows: 1, columns: 2)
m5[0, 0] = 0; m5[0, 1] = -1
m5.show()
 
var m6 = NumMatrix<Double>(rows: 2, columns: 2)
m6[0, 0] = 1.0; m6[0, 1] = 2.0;
m6[1, 0] = 3.0; m6[1, 1] = 4.0;
m6.show()
 
var m7 = NumMatrix<Double>(rows: 2, columns: 2)
m7[0, 0] = -2.0; m7[0, 1] = -1.0;
m7[1, 0] = -4.0; m7[1, 1] = -3.0;
m7.show()
 
⤢m3
m3.show()
 
⟳m4
m4.show()
 
let multiplyTwoMatrix = try! m1 * m2
multiplyTwoMatrix.show()
 
let multiplyMatrixByNum = try! m1 * 5
multiplyMatrixByNum.show()
 
let multiplyNumByMatrix = try! 10 * m2
multiplyNumByMatrix.show()
 
let addTwoMatrix = try! m6 + m7
addTwoMatrix.show()
 
let subtractTwoMatrix = try! m6 - m7
subtractTwoMatrix.show()
 
do {
    let multiplyTwoMatrix = try m1 * m5
} catch let error as MatrixError {
    print(error.rawValue)
} catch {
    print("Generic error thrown!")
}
 
do {
    let addTwoMatrix = try m1 + m5
} catch let error as MatrixError {
    print(error.rawValue)
} catch {
    print("Generic error thrown!")
}
 
do {
    let subtractTwoMatrix = try m1 - m5
} catch let error as MatrixError {
    print(error.rawValue)
} catch {
    print("Generic error thrown!")
}