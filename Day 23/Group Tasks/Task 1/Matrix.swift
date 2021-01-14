/* Daniela, Dimitar & Emilia */

prefix operator ↻
prefix operator ↺
prefix operator ⤡

protocol MatrixRange {}

extension ClosedRange: MatrixRange {}
extension PartialRangeFrom: MatrixRange {}
extension PartialRangeThrough: MatrixRange {}
extension Range: MatrixRange {}
extension PartialRangeUpTo: MatrixRange {}

enum MatrixError: Error {
    case unsuitableMeasures
    case cannotInitAbstractClass
}

internal class AbstractMatrix<T> {
    internal var rows: Int, columns: Int
    internal var arr: [T]
    let unit: T

    internal init(rows: Int, columns: Int, unit: T)  {
        self.rows = rows
        self.columns = columns
        self.unit = unit
        self.arr = Array(repeating: unit, count: rows * columns)
    }

    internal init(rows: Int, columns: Int, _ funcRandomValue: () -> T) {
        self.rows = rows
        self.columns = columns
        arr = [T]()
        arr.reserveCapacity(rows * columns)
        self.unit = funcRandomValue() 
        for _ in 0 ..< rows * columns {
            arr.append(funcRandomValue()) 
        }
    }
    
    internal init(rows: Int, columns: Int, unit: T, arr: [T]) {
        self.rows = rows
        self.columns = columns
        self.unit = unit
        self.arr = arr
    }

    internal init(_ submatrix: SubMatrix<T>) {
		self.rows = submatrix.rows
		self.columns = submatrix.columns
		self.unit = submatrix.unit
		if submatrix.arr.count == 0 {
			self.arr = submatrix.arrFromMatrixRef()
			return
		}
		self.arr = submatrix.arr
    }

    internal func rotateClockwise() {
        var res = AbstractMatrix<T>(rows: columns, columns: rows, unit: unit)
        for r in 0 ..< rows {
            for c in 0 ..< columns {
                res[c, rows - r - 1] = self[r, c]
            }
        }
        arr = res.arr
        (rows, columns) = (columns, rows)
    }

    static prefix func ↺(_ mat: AbstractMatrix<T>) -> AbstractMatrix<T> {
        var res = AbstractMatrix<T>(rows: mat.columns, columns: mat.rows, unit: mat.unit)
        for r in 0 ..< mat.rows {  
            for c in 0 ..< mat.columns { 
                res[c, r] = mat[r, mat.columns - c - 1]
            }
        }
        return res
    }
    
    func rotateCounterClockwise() {
        let res = ↺self
        arr = res.arr
        (rows, columns) = (columns, rows)
    }
    
    static prefix func ⤡(_ mat: AbstractMatrix<T>) -> AbstractMatrix<T> {
        var res = AbstractMatrix<T>(rows: mat.columns, columns: mat.rows, unit: mat.unit)
        for r in 0 ..< mat.rows {
            for c in 0 ..< mat.columns {
                res[c, r] = mat[r, c]
            }
        }
        return res
    }

    func transpose() {
        let res = ⤡self
        arr = res.arr
        (rows, columns) = (columns, rows)
    }

    func printMatrix() {
        for i in 0 ..< rows {
            print(arr[i * columns ..< i * columns + columns])
        }
        print("\n")
    }

    subscript(_ row : Int, _ col : Int) -> T {
        get {
            assert(1 == 2)
        } set {
            assert(1 == 2)
        }
    }

    subscript(rows: MatrixRange, columns: MatrixRange) -> AbstractMatrix<T> {
      get {
        assert(1 == 2)
      }
    }
}

class Matrix<T> : AbstractMatrix<T>{
    override subscript(row: Int, column: Int) -> T {
        get {
            let isInvalid = row < 0 || column < 0 || row >= rows || column >= columns 
            let i = isInvalid ? arr.count : (row * columns) + column
            return arr[i]
        }
        set {
            let isInvalid = row < 0 || column < 0 || row >= rows || column >= columns 
            let i = isInvalid ? arr.count : (row * columns) + column
            arr[i] = newValue
        }
    }

    func getBounds(_ range: MatrixRange, _ maxBound: Int) -> ClosedRange<Int> {
      	switch range {
      	case let r as ClosedRange<Int>:
          	return r
      	case let r as PartialRangeFrom<Int>:
          	return r.lowerBound...maxBound - 1
      	case let r as PartialRangeThrough<Int>:
          	return 0...r.upperBound
      	case let r as PartialRangeUpTo<Int>:
          	return 0...r.upperBound - 1
      	case let r as Range<Int>:
        	return r.lowerBound...r.upperBound - 1
      	default:
          	return 0...maxBound - 1
      	}
    }

    override subscript(rows: MatrixRange, columns: MatrixRange) -> SubMatrix<T> {
        get {
          var rangeRows = getBounds(rows, self.rows)
          var rangeColumns = getBounds(columns, self.columns)

          if rangeRows.lowerBound < 0 || rangeColumns.lowerBound < 0 || rangeRows.upperBound >= self.rows 
		  	|| rangeColumns.upperBound >= self.columns {
               return SubMatrix<T>(0...0, 0...0, self)
          }
          return SubMatrix<T>(rangeRows, rangeColumns, self)
        }
    }
}

class SubMatrix<T> : Matrix<T> {
	private var rowsLowerBound: Int
	private var colsLowerBound: Int
	private var rowsUpperBound: Int
	private var colsUpperBound: Int
	private var matrixRef: Matrix<T>

  	init(_ rowsRange: ClosedRange<Int>, _ colsRange: ClosedRange<Int>, _ matrix: Matrix<T>) {
		self.rowsLowerBound = rowsRange.lowerBound
		self.rowsUpperBound = rowsRange.upperBound
		self.colsLowerBound = colsRange.lowerBound
		self.colsUpperBound = colsRange.upperBound
		self.matrixRef = matrix
		let countRows = rowsUpperBound - rowsLowerBound + 1
		let countColumns = colsUpperBound - colsLowerBound + 1
		super.init(rows: countRows, columns: countColumns, unit: matrixRef.unit, arr: [T]())
  	}

	override subscript(row: Int, column: Int) -> T {
		get {
			if row < 0 || column < 0 || row >= rows || column >= columns {
			return matrixRef[-1, -1]
			}
			if arr.count == 0 {
				let i = rowsLowerBound + row
				let j = colsLowerBound + column
				return matrixRef[i, j]
			}

			let i = row * columns + column
			return arr[i]
		}
		set {
			if arr.count == 0 {
				arr = self.arrFromMatrixRef()
			}

			let i = row * columns + column
			arr[i] = newValue
		}
    	}

	func arrFromMatrixRef() -> [T] {
		var resArr = [T]()
		resArr.reserveCapacity(rows * columns)
		for r in rowsLowerBound ... rowsUpperBound {
			for c in colsLowerBound ... colsUpperBound {
				resArr.append(matrixRef[r,c])
			}
		}
		return resArr
	}
	
	func printSubMatrix() {
	    	if arr.count > 0 {
		      	self.printMatrix()
		      	return 
		}	
	
		for i in rowsLowerBound ... rowsUpperBound {
			for j in colsLowerBound ... colsUpperBound {
			      	print(matrixRef[i, j], terminator: " ")
			}
		}
		print("\n")
	}
}

func randomInt() -> Int {
    return Int.random(in: 1...100)
}
    
func randomDouble() -> Double {
    return Double.random(in: 1.0...100.0)
}

func randomFloat() -> Float {
    return Float.random(in: 1.0...100.0)
}

func randomBool() -> Bool {
    let num = Int.random(in: 1...100)
    return num % 2 == 0 
}
    
func randomString() -> String { 
    let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o",
        "p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H",
        "I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9"]
    let randIndex = Int.random(in: 0..<letters.count)
    return String(letters[randIndex])
}
        
func randomCharacter() -> Character {
    let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o",
        "p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H",
        "I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9"]
    let randIndex = Int.random(in: 0..<letters.count)
    return Character(letters[randIndex])
}

/*
// Matrix 
var m = Matrix<String>(rows: 2, columns: 2, unit: "")
m[0, 0] = "a"; m[0, 1] = "b"
m[1, 0] = "c"; m[1, 1] = "d"
m.printMatrix()
var sm = try m[0...1, 1..<2]
sm.printSubMatrix()
sm[0, 0] = "q"
sm.printSubMatrix()
m.printMatrix()
var m2 = Matrix<String>(sm)
m2.printMatrix()
*/
var m3 = Matrix<Int>(rows: 2, columns: 2, unit: 0)
m3[0, 0] = 1; m3[0, 1] = 2
m3[1, 0] = 3; m3[1, 1] = 4
m3.printMatrix()
var sm1 = m3[1..., 0...]
sm1.printSubMatrix()

var m4 = Matrix<Int>(sm1)
m4.printMatrix()

// var sm2 = sm1[0...0, 0...0]
// sm2.printMatrix()