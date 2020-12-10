enum ParserState  { case inQuote, noQuote }

func parseCSV(_ line: String) -> [String] {
    var result = [String]();
    var value = "";
    var parserState: ParserState = .noQuote
    var quote: Character = " "
    
    for c in line {
        switch c {
        case ",":
            if parserState != .noQuote {
               value += String(c)
            } else {
                result.append(value)
                value = ""
            }
        case "'", "\"":
            if value.last == "\\"{
                value.removeLast()
                value += String(c)
            } else if parserState == .inQuote {
                if c != quote {
                    value += String(c)
                } else {
                    parserState = .noQuote
                }
            } else {
                parserState = .inQuote
                quote = c
            }
        case "\\":
            if value.last == "\\"{
                value.removeLast()
                value += String(c)
            } else {
                value += String(c)
            }
        case " ":
            if parserState != .noQuote {
               value += String(c)
            }
        default:
            value += String(c)
        }
    }
    
    result.append(value)
    return result
}

var line = #"12, 'aa, aa' , "b\\bb bb", ala bala"#
let result = parseCSV(line);
print(result)