import Foundation

fileprivate func partOne(input: [String]) -> Int {
    
    var pattern = input
    var counter: Int = 0
    
    while pattern[0].count < 3 * (pattern.count - 1) {
        pattern = zip(pattern, input).map { String($0.0 + $0.1) }
    }
    
    for (index, line) in pattern.enumerated() {
        let indexChar = (3 * index) + 1
        let char = String(line.prefix(indexChar)).last ?? " "
                          
        if char == "#" { counter += 1}
    }
    
    return counter
}

fileprivate func partTwo(input: [String]) -> Int {
    
    let slopes = [(1, 1), (3, 1), (5, 1), (7, 1), (1, 2)]
    var results: [Int] = []
    
    for slope in slopes {
        
        var pattern = input
        var counter: Int = 0
        var offset: Int = 0
        
        while pattern[0].count < slope.0 * (pattern.count - 1) {
            pattern = zip(pattern, input).map { String($0.0 + $0.1) }
        }
        
        for (index, line) in pattern.enumerated() {
            guard index % slope.1 == 0 else { continue }
            
            let indexChar = (slope.0 * offset) + 1
            let char = String(line.prefix(indexChar)).last ?? " "
            
            if char == "#" { counter += 1}
            offset += 1
        }
        
        results.append(counter)
    }
    
    return results.reduce(1, *)
}

public func dayThree(input: [String]) -> String {
    
    let results = (partOne(input: input), partTwo(input: input))
    print("\nDAY THREE\nPart one:", results.0, "\nPart two:", results.1)
    return "\(results.0), \(results.1)"
}
