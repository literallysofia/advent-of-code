import Foundation

fileprivate func partOne(input: [String]) -> Int {
    
    var counter: Int = 0
    
    for line in input {
        
        let arr = line.components(separatedBy: ": ")
        let policy = arr[0].split(separator: " ")
        let password = arr[1]
        let times = policy[0].split(separator: "-")
        let char: Character = String(policy[1]).map{$0}[0]
        let numOfChars = password.filter({ $0 == char }).count
        
        guard let min = Int(times[0]), let max = Int(times[1]) else { continue }
        
        if min...max ~= numOfChars { counter += 1 }
    }
    
    return counter
}

fileprivate func partTwo(input: [String]) -> Int {
    
    var counter: Int = 0
    
    for line in input {
        
        let arr = line.components(separatedBy: ": ")
        let policy = arr[0].split(separator: " ")
        let password = arr[1]
        let times = policy[0].split(separator: "-")
        let char: Character = String(policy[1]).map{$0}[0]
        
        guard let min = Int(times[0]), let max = Int(times[1]) else { continue }
        
        let minIndex = password.index(password.startIndex, offsetBy: min-1)
        let maxIndex = password.index(password.startIndex, offsetBy: max-1)
        
        let matchesMinIndex = password[minIndex] == char
        let matchesMaxIndex = password[maxIndex] == char
        
        switch (matchesMinIndex, matchesMaxIndex) {
        case (true, false),
             (false, true):
            counter += 1
        default:
            break
        }
    }
    
    return counter
}

public func dayTwo(input: [String]) -> String {
    
    let results = (partOne(input: input), partTwo(input: input))
    print("\nDAY TWO\nPart one:", results.0, "\nPart two:", results.1)
    return "\(results.0), \(results.1)"
}
