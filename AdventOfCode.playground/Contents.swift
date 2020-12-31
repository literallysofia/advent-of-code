import Foundation

func content(_ inputFileName: String) -> String {
    
    let fileUrl = Bundle.main.url(forResource: inputFileName, withExtension: "txt")
    return try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
}

dayOne(input: Input.one)
dayTwo(input: Input.two)
dayThree(input: Input.three)
dayFour(input: Input.four)
dayFive(input: Input.five)
daySix(input: Input.six)

// MARK: - Inputs

struct Input {
    
    static let one: [Int] = content("Day1")
        .split(separator: "\n")
        .compactMap { Int($0) }
    
    static let two: [String] = content("Day2")
        .split(separator: "\n")
        .compactMap { String($0) }
    
    static let three: [String] = content("Day3")
        .split(separator: "\n")
        .compactMap { String($0) }
    
    static let four: [[String: String]] = content("Day4")
        .components(separatedBy: "\n\n")
        .map {
            let passport = $0.split(separator: "\n").joined(separator: " ").split(separator: " ")
            return passport
                .map { $0.components(separatedBy: ":") }
                .reduce(into: [String:String]()) { dict, pair in
                    dict[pair[0]] = pair[1]
                }
        }
    
    static let five: [String] = content("Day5")
        .split(separator: "\n")
        .compactMap { String($0) }
    
    static let six: [String] = content("Day6")
        .components(separatedBy: "\n\n")
}
