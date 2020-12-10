enum Color : String {
    case red = "#FF0000"
    case green = "#00FF00"
    case blue = "#0000FF"
    case black = "#000000"
    case white = "#FFFFFF"
}

func drawPoint(x : Int, y : Int, color: Color) {
    print(color.rawValue)
    
    if color == .blue {
        print("blue dot")
    }
    
    switch color {
        case .red, .blue: 
            print("red or blue dot")
        default: 
            print("other colors")
    }
}

drawPoint(x: 0, y: 5, color: .blue)
drawPoint(x: 5, y: 0, color: .green)