import Foundation

fileprivate var identifiers: [Int] = []

fileprivate func partOne(input: [String]) -> Int {
    
    for boardingPass in input {
        
        var row: (Double, Double) = (0, 127)
        var column: (Double, Double) = (0, 7)
        
        boardingPass.forEach { char in
            
            switch char {
            case "F":
                let value = (row.1 - row.0) / 2 + row.0
                row = (row.0, floor(value))
                break
            case "B":
                let value = (row.1 - row.0) / 2 + row.0
                row = (ceil(value), row.1)
                break
            case "L":
                let value = (column.1 - column.0) / 2 + column.0
                column = (column.0, floor(value))
                break
            case "R":
                let value = (column.1 - column.0) / 2 + column.0
                column = (ceil(value), column.1)
                break
            default:
                break
            }
        }
        
        identifiers.append(Int(row.0 * 8 + column.0))
    }
    
    return identifiers.max() ?? 0
}

fileprivate func partTwo() -> Int {
    
    identifiers.sort()
    var index = 0
    
    while index + 1 < identifiers.count - 1 {
        
        let diff = identifiers[index + 1] - identifiers[index]
        
        if diff > 1 { return identifiers[index] + 1 }
        
        index += 1
    }

    return 0
}

public func dayFive(input: [String]) -> String {
    
    let results = (partOne(input: input), partTwo())
    print("\nDAY FIVE\nPart one:", results.0, "\nPart two:", results.1)
    return "\(results.0), \(results.1)"
}
