import Foundation

fileprivate func partOne(input: [String]) -> Int {
    
    let answers = input.compactMap { String($0.replacingOccurrences(of: "\n", with: "")) }
    
    return answers
        .map { group in
            var uniqueElements = Set<Character>()
            return group.filter { uniqueElements.insert($0).inserted }.count
        }
        .reduce(0, +)
}

fileprivate func partTwo(input: [String]) -> Int {
    
    let answers: [(Int, String)] = input.compactMap {
        ($0.split(separator: "\n").count,
        String($0.replacingOccurrences(of: "\n", with: "")))
    }
    
    return answers
        .compactMap {
            let total = $0.0
            return Array($0.1).histogram().filter { $0.value == total }.count
        }
        .reduce(0, +)
}

extension Sequence where Element: Hashable {
    func histogram() -> [Element: Int] {
        self.reduce(into: [:]) { counts, elem in counts[elem, default: 0] += 1 }
    }
}

public func daySix(input: [String]) -> String {
    
    let results = (partOne(input: input), partTwo(input: input))
    print("\nDAY SIX\nPart one:", results.0, "\nPart two:", results.1)
    return "\(results.0), \(results.1)"
}
