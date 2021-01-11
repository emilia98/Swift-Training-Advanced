extension String {
    static func * (str: String, repeatTimes: Int) -> String {
        return String(repeating: str, count: repeatTimes)
    }
}

let s = "a" * 10
print(s)