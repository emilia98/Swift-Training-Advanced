func printArray(_ arr : [Int], _ size : Int) {
    if size == 1 {
         print(arr[size - 1], terminator: " ")
        return
    }
    
    printArray(arr, size - 1)
    print(arr[size - 1], terminator: " ")
}

printArray([1, 2, 3, 4, 5], 5)