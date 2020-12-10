class NoiceReducer {
    let consecutiveAvgs = 3
    var avgs = [Double]()
    var temps = [Double]()
    
    func measure(_ value : Double) -> Double {
        temps.append(value)
        
        var avg = 0.0
        
        if temps.count < consecutiveAvgs {
            avg = temps[temps.count - 1]
        } else {
            let values = Array(temps[temps.count - consecutiveAvgs..<temps.count])
            avg = calculateAvg(values)
        }
        
        avgs.append(avg)
        
        return avgs[avgs.count - 1]
    }
    
    
    func getAll() -> [Double] {
        return avgs
    }
    
    private func calculateAvg(_ values : [Double]) -> Double{
        var avg = 0.0
    
        for value in values {
            avg += value
        }
    
        return Double(avg) / Double(consecutiveAvgs)
    }
}

var reducer = NoiceReducer()
var lastTemp = reducer.measure(21)
print(lastTemp)

lastTemp = reducer.measure(22)
print(lastTemp)

lastTemp = reducer.measure(20)
print(lastTemp)

lastTemp = reducer.measure(24)
print(lastTemp)

lastTemp = reducer.measure(18)
print(lastTemp)

lastTemp = reducer.measure(21)
print(lastTemp)

lastTemp = reducer.measure(19)
print(lastTemp)

let allResults = reducer.getAll()
print(allResults)