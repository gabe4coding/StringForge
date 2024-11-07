import Foundation

public extension String {
    
    // Basic Type Checks
    var isAlphanumeric: Bool { matches(.alphanumerics) }
    var isAlphabetic: Bool { matches(.letters) }
    var isNumeric: Bool { matches(.decimalDigits) }
    var isUppercased: Bool { matches(.uppercaseLetters) }
    var isLowercased: Bool { matches(.lowercaseLetters) }
    var isPunctuation: Bool { matches(.punctuationCharacters) }
    var isSymbol: Bool { matches(CharacterSet.symbols.union(.punctuationCharacters)) }
    var isWhitespace: Bool { matches(.whitespacesAndNewlines) }

    // Complex Checks
    var isBool: Bool { ["true", "false"].contains(lowercased()) }
    var isInt: Bool { Int(self) != nil }
    var isDouble: Bool { Double(self) != nil }
    var isFloat: Bool { Float(self) != nil }
    var isHexColor: Bool { matches(pattern: #"^#?([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$"#) }
    var isStrongPassword: Bool { matches(pattern: #"^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+=-]).{8,}$"#) }
    var isPalindrome: Bool {
        guard !isEmpty else { return false }
        let cleaned = lowercased().filter { $0.isLetter }
        return cleaned == String(cleaned.reversed())
    }
    var isValidJSON: Bool { data(using: .utf8).flatMap { try? JSONSerialization.jsonObject(with: $0) } != nil }
    var isEmail: Bool { matches(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}") }
    var isURL: Bool {
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return false
        }
        
        let range = NSRange(location: 0, length: utf16.count)
        let matches = detector.matches(in: self, options: [], range: range)
        
        // Ensure the entire string matches a URL pattern
        return matches.count == 1 && matches.first?.range == range
    }

    // IP, MAC, and UUID Address Checks
    var isIPAddress: Bool {
        matches(pattern: #"^((25[0-5]|2[0-4][0-9]|[0-1]?[0-9]{1,2})\.){3}(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]{1,2})$"#) ||
        matches(pattern: #"^([0-9a-fA-F]{1,4}:){7}([0-9a-fA-F]{1,4})$"#)
    }
    var isMACAddress: Bool { matches(pattern: #"^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$"#) }
    var isUUID: Bool { matches(pattern: #"^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"#) }

    // Credit Card, Phone, SSN, and Zip Code Validations
    var isPhoneNumber: Bool { matches(pattern: #"^(\+?\d{1,4}[\s-]?)?\(?\d{3}\)?[\s-]?\d{3}[\s-]?\d{4}$"#) }
    var isCreditCardNumber: Bool { matches(pattern: #"^\d{13,19}$"#) && luhnCheck() }
    var isCreditCardExpirationDate: Bool { matches(pattern: #"^(0[1-9]|1[0-2])\/\d{2}$"#) }
    var isCreditCardCVV: Bool { matches(pattern: #"^\d{3,4}$"#) }
    var isSocialSecurityNumber: Bool { matches(pattern: #"^\d{3}-\d{2}-\d{4}$"#) }
    var isZipCode: Bool { matches(pattern: #"^\d{5}(-\d{4})?$"#) }
    
    // Contains Checks
    var containsEmoji: Bool { unicodeScalars.contains { $0.properties.isEmoji } }
    var containsAlphanumeric: Bool { containsCharacter(from: .alphanumerics) }
    var containsAlphabetic: Bool { containsCharacter(from: .letters) }
    var containsNumeric: Bool { containsCharacter(from: .decimalDigits) }
    var containsUppercased: Bool { containsCharacter(from: .uppercaseLetters) }
    var containsLowercased: Bool { containsCharacter(from: .lowercaseLetters) }
    var containsPunctuation: Bool { containsCharacter(from: .punctuationCharacters) }
    var containsSymbol: Bool { containsCharacter(from: CharacterSet.symbols.union(.punctuationCharacters)) }
    var containsWhitespace: Bool { containsCharacter(from: .whitespacesAndNewlines) }
}

extension String {
    // Private Helper Methods
    private func matches(_ characterSet: CharacterSet) -> Bool {
        !isEmpty && rangeOfCharacter(from: characterSet.inverted) == nil
    }
    
    private func containsCharacter(from characterSet: CharacterSet) -> Bool {
        rangeOfCharacter(from: characterSet) != nil
    }
    
    private func matches(pattern: String) -> Bool {
        range(of: pattern, options: .regularExpression) != nil
    }
}
