import Foundation

func content(_ inputFileName: String) -> String {
    
    let fileUrl = Bundle.main.url(forResource: inputFileName, withExtension: "txt")
    return try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
}

dayOne(input: Input.one)
dayTwo(input: Input.two)
dayThree(input: Input.three)

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
}
