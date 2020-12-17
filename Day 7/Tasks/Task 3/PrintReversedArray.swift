func printArray(_ arr : [Int], _ size : Int) {
    if size == 1 {
        print(arr[size - 1])
        return
    }
    print(arr[size - 1],  terminator: " ")
    printArray(arr, size - 1)
}

printArray([1, 2, 3, 4, 5], 5)