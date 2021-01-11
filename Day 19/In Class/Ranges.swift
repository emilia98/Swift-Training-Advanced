let names = ["Piper", "Alex", "Suzanne", "Gloria"]
print(names[2...])

var range = 1 ... 2
print(range.count)

for name in names[...2] {
    print(name)
}

var str = "Hello, playground"
let index = str.index(str.startIndex, offsetBy: 5)
let r = ..<index
print(str[r])