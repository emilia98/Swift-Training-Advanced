func noiceReducer( _ temps : [Int]) -> [Double] {
    let consecutiveAvgs = 3
    
    var avgs = [Double]()
    
    for i in 0...temps.count - consecutiveAvgs {
        let values = Array(temps[i..<i + consecutiveAvgs])
        let avg = calculateAvg(values, consecutiveAvgs)
        avgs.append(avg)
    }
    
    return avgs
}

func calculateAvg(_ values : [Int], _ consecutiveAvgs : Int) -> Double {
    var avg = 0
    
    for value in values {
        avg += value
    }
    
    return Double(avg) / Double(consecutiveAvgs)
}

var reduceResult = noiceReducer([21, 22, 20, 24, 18, 21, 19])
print(reduceResult)