enum OutOfRangeError : String, Error {
    case rowOutOfRange = "Row is out of range!"
    case colOutOfRange = "Column is out of range!"
    case outOfRange = "Index out of range"
}

class Matrix {
    var rows: Int
    var cols: Int
    var arr : [Int]
    
    init(_ rows : Int, _ cols: Int) {
        self.rows = rows
        self.cols = cols
        arr = Array(repeating: 0, count: rows * cols)
    }
    
    subscript(_ row: Int, _ col: Int) -> Int? {
        get {
            if hasError(row, col) {
                return nil
            }
            
            let index = row * cols + col
            return arr[index]
            
        }
        set(newValue) {
            if hasError(row, col) {
                print(OutOfRangeError.outOfRange)
                return
            }
            let index = row * cols + col
            arr[index] = newValue!
        }
    }
    
    private func hasError(_ row : Int, _ col : Int) -> Bool {
        if row < 0 || row >= rows {
            return true
        }
            
        if col < 0 || col >= cols {
            return true
        }
        
        return false
    }
    
    func rotate() -> Matrix {
        var newM = Matrix(self.cols, self.rows)
        
        var index = 0
        for col in 0 ... cols - 1 {
            for row in stride(from: rows - 1, through: 0, by: -1) {
                let x = arr[row * cols + col]
                newM.arr[index] = x
                index += 1
            }
        }
        
        return newM
    }
    
    func transponse() -> Matrix {
        var newM = Matrix(self.cols, self.rows)
        
        var index = 0
        
        for col in 0 ... cols - 1 {
            for row in 0 ... rows - 1 {
                let x = arr[row * cols + col]
                newM.arr[index] = x
                index += 1
            }
        }
        return newM
    }
    
    func show() {
        for row in 0 ... rows - 1 {
            var res = ""
            for col in 0 ... cols - 1 {
                res += "\(arr[row * cols + col])"
                res += col < cols - 1 ? " " : ""
                
            }
            print(res)
        }
        print("-----")
    }
}

/*
var m = Matrix(2, 4)
m[1, 3] = 7

if let num = m[1, 3] {
    print(num)
} else {
    print(OutOfRangeError.outOfRange.rawValue)
}

if let num = m[1, 4] {
    print(num)
} else {
    print(OutOfRangeError.outOfRange.rawValue)
}

m[3, 4] = 5
m[1, 4] = 5
*/
var m = Matrix(2, 3)
m[0, 0] = 1
m[0, 1] = 2
m[0, 2] = 3
m[1, 0] = 4
m[1, 1] = 5
m[1, 2] = 6
m.show()

var rotatedM = m.rotate()
rotatedM.show()

var transponsedM = m.transponse()
transponsedM.show()

var m1 = Matrix(3, 3)
m1[0, 0] = 1
m1[0, 1] = 2
m1[0, 2] = 3
m1[1, 0] = 4
m1[1, 1] = 5
m1[1, 2] = 6
m1[2, 0] = 7
m1[2, 1] = 8
m1[2, 2] = 9
m1.show()

var rotatedM1 = m1.rotate()
rotatedM1.show()

var transponsedM1 = m1.transponse()
transponsedM1.show()