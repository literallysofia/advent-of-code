import Foundation

fileprivate func partOne(input: [[String: String]]) -> Int {
    
    var counter: Int = 0
    let fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]
    
    for passport in input {
        
        let isValid = fields.map { field -> Bool in
            guard passport[field] != nil || field == "cid" else { return false }
            return true
        }
        .filter { $0 == false }
        .isEmpty
        
        if isValid { counter += 1 }
    }
    
    return counter
}

fileprivate enum Field {
    case byr(String)
    case iyr(String)
    case eyr(String)
    case hgt(String)
    case hcl(String)
    case ecl(String)
    case pid(String)
    case cid
    
    var isValid: Bool {
        switch self {
        case .byr(let value) where value.count == 4 && 1920...2002 ~= Int(value)!:
            return true
            
        case .iyr(let value) where value.count == 4 && 2010...2020 ~= Int(value)!:
            return true
            
        case .eyr(let value) where value.count == 4 && 2020...2030 ~= Int(value)!:
            return true
            
        case .hgt(let value):
            if value.contains("cm") {
                guard let num = Int(value.dropLast(2)), 150...193 ~= num else { return false }
                return true
            } else if value.contains("in") {
                guard let num = Int(value.dropLast(2)), 59...76 ~= num else { return false }
                return true
            }
            return false
            
        case .hcl(let value) where value.contains("#"):
            let regex = try! NSRegularExpression(pattern: "[0-9a-f]")
            let range = NSRange(location: 0, length: value.count)
            if regex.matches(in: value, range: range).count == 6 { return true } else { return false }
            
        case .ecl(let value) where value == "amb" || value == "blu" || value == "brn" || value == "gry" || value == "grn" || value == "hzl" || value == "oth":
            return true
            
        case .pid(let value) where value.count == 9 && Int(value) != nil:
            return true
            
        case .cid:
            return true
            
        default:
            return false
        }
    }
}

fileprivate func partTwo(input: [[String: String]]) -> Int {
    
    var counter: Int = 0
    let fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]
    
    for passport in input {
        
        let isValid = fields.map { fieldName -> Bool in
            
            guard passport[fieldName] != nil || fieldName == "cid" else { return false }
            
            let content = passport[fieldName] ?? ""
            let field: Field
            
            switch fieldName {
            case "byr":
                field = .byr(content)
            case "iyr":
                field = .iyr(content)
            case "eyr":
                field = .eyr(content)
            case "hgt":
                field = .hgt(content)
            case "hcl":
                field = .hcl(content)
            case "ecl":
                field = .ecl(content)
            case "pid":
                field = .pid(content)
            case "cid":
                field = .cid
            default:
                return false
            }
            
            return field.isValid
        }
        .filter { $0 == false }
        .isEmpty
        
        if isValid { counter += 1 }
    }
    
    return counter
}

public func dayFour(input: [[String: String]]) -> String {
    
    let results = (partOne(input: input), partTwo(input: input))
    print("\nDAY FOUR\nPart one:", results.0, "\nPart two:", results.1)
    return "\(results.0), \(results.1)"
}
