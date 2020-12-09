class NoiceReducer {
    let consecutiveAvgs = 3
    var avgs = [Double]()
    var temps = [Double]()
    
    func measure(_ value : Double) {
        temps.append(value)
    }
    
    func calculate() -> Double {
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
reducer.measure(21)

var lastTemp = reducer.calculate()
print(lastTemp)

reducer.measure(22)
lastTemp = reducer.calculate()
print(lastTemp)

reducer.measure(20)
lastTemp = reducer.calculate()
print(lastTemp)

reducer.measure(24)
lastTemp = reducer.calculate()
print(lastTemp)

reducer.measure(18)
lastTemp = reducer.calculate()
print(lastTemp)

reducer.measure(21)
lastTemp = reducer.calculate()
print(lastTemp)

reducer.measure(19)
lastTemp = reducer.calculate()
print(lastTemp)

let allResults = reducer.getAll()
print(allResults)