enum ParserState  {
    case singleQuote
    case doubleQuote
    case noQuote
}
func parseCSV(_ line: String) -> [String] {
    var result = [String]();
    var value = "";
    var parserState = ParserState.noQuote
    for c in line {
        switch c {
        case ",":
            if parserState == ParserState.singleQuote || parserState == ParserState.doubleQuote {
               value += String(c)
            } else {
                result.append(value)
                value = ""
            }
        case "'":
            if parserState == ParserState.doubleQuote {
                value += String(c)
            } else if parserState == ParserState.noQuote {
                parserState = ParserState.singleQuote
            } else {                
               parserState = ParserState.noQuote
            }
        case "\"":
            if parserState == ParserState.singleQuote {
                value += String(c)
            } else if parserState == ParserState.noQuote {
                parserState = ParserState.doubleQuote
            } else {                
               parserState = ParserState.noQuote
            }
        case " ":
            if parserState == ParserState.singleQuote || parserState == ParserState.doubleQuote {
               value += String(c)
            }
        default:
            value += String(c)
        }
    }
    result.append(value)
    return result
}
var line = """
12, 'aa, aa' , "bb bb", ala bala
"""
let result = parseCSV(line);
print(result)