import Foundation

fileprivate func partOne(input: [Int], sum: Int = 2020) -> Int? {
    
    var entries: Set<Int> = []
    
    return input
        .compactMap { n1 -> Int? in
            let n2 = sum - n1
            guard entries.contains(n2) else {
                entries.insert(n1)
                return nil
            }
        
            return n1 * n2
        }
        .first
}

fileprivate func partTwo(input: [Int], sum: Int = 2020) -> Int? {
    
    return input
        .compactMap { n1 -> Int? in
            var entries: Set<Int> = []
            
            return input
                .compactMap { n2 -> Int? in
                    let n3 = sum - (n1 + n2)
                    guard entries.contains(n3) else {
                        entries.insert(n2)
                        return nil
                    }
                
                    return n1 * n2 * n3
                }
                .first
        }
        .first
}

public func dayOne(input: [Int]) -> String {
    
    let results = (partOne(input: input)!, partTwo(input: input)!)
    print("DAY ONE\nPart one:", results.0, "\nPart two:", results.1)
    return "\(results.0), \(results.1)"
}
