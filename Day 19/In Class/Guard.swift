func printMeaningOfLife() {
    if let name = getMeaningOfLife() {
        print(name)
    }
}

func printMeaningOfLife() {
    guard let name = getMeaningOfLife() else {
        return
    }

    print(name)
}