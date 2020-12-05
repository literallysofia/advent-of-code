import Foundation

func content(_ inputFileName: String) -> String {
    
    let fileUrl = Bundle.main.url(forResource: inputFileName, withExtension: "txt")
    return try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
}

dayOne(input: Input.one)

// MARK: - Inputs

struct Input {
    
    static let one: [Int] = content("Day1")
        .split(separator: "\n")
        .compactMap{ Int($0) }
}
