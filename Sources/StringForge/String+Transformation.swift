import Foundation
import SwiftUI

public extension String {
    
    // MARK: - Character Removal Transformations
    
    /// Returns a new string by removing all whitespaces.
    /// - Example: `" hello world "` becomes `"helloworld"`
    var withoutSpaces: String {
        replacingOccurrences(of: " ", with: "")
    }
    
    /// Returns a new string by removing all special characters, leaving only alphanumeric characters.
    /// - Example: `"hello, world!"` becomes `"helloWorld"`
    var withoutSpecialCharacters: String {
        replacingOccurrences(of: "[^a-zA-Z0-9]", with: "", options: .regularExpression)
    }
    
    /// Returns a new string by removing all whitespaces and special characters.
    /// - Example: `" hello, world! "` becomes `"helloWorld"`
    var withoutSpacesAndSpecialCharacters: String {
        withoutSpaces.withoutSpecialCharacters
    }
    
    // MARK: - Type Conversions
    
    var toInt: Int? { Int(self) }
    var toDouble: Double? { Double(self) }
    var toFloat: Float? { Float(self) }
    var toBool: Bool? { Bool(self) }
    var toURL: URL? { URL(string: self) }
    var toData: Data? { data(using: .utf8) }
    var toUUID: UUID? { UUID(uuidString: self) }
    
    /// Converts a hex color string to a `Color`.
    /// Supports hex strings in the following formats: `#RRGGBB`, `RRGGBB`, `#RGB`, or `RGB`.
    var toColor: Color? {
        var hexSanitized = self.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        // Determine hex string length and parse accordingly
        var rgbValue: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&rgbValue) else {
            return nil
        }
        
        let length = hexSanitized.count
        let red, green, blue, alpha: Double
        
        switch length {
        case 3: // RGB (12-bit)
            red   = Double((rgbValue >> 8) & 0xF) / 15
            green = Double((rgbValue >> 4) & 0xF) / 15
            blue  = Double(rgbValue & 0xF) / 15
            alpha = 1.0
        case 6: // RRGGBB (24-bit)
            red   = Double((rgbValue >> 16) & 0xFF) / 255
            green = Double((rgbValue >> 8) & 0xFF) / 255
            blue  = Double(rgbValue & 0xFF) / 255
            alpha = 1.0
        case 8: // AARRGGBB (32-bit)
            alpha = Double((rgbValue >> 24) & 0xFF) / 255
            red   = Double((rgbValue >> 16) & 0xFF) / 255
            green = Double((rgbValue >> 8) & 0xFF) / 255
            blue  = Double(rgbValue & 0xFF) / 255
        default:
            return nil
        }
        
        return Color(red: red, green: green, blue: blue, opacity: alpha)
    }
    
    // MARK: - Date Conversions
    
    /// Converts the string to a `Date` using a specified format.
    /// - Parameter format: A date format string.
    /// - Returns: A `Date` if conversion is successful, `nil` otherwise.
    func toDate(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
    /// Converts the string to a `Date` by attempting multiple formats in order.
    /// - Parameter formats: An array of date format strings.
    /// - Returns: A `Date` if conversion is successful with any format, `nil` otherwise.
    func toDate(formats: [String]) -> Date? {
        let formatter = DateFormatter()
        for format in formats {
            formatter.dateFormat = format
            if let date = formatter.date(from: self) {
                return date
            }
        }
        return nil
    }
    
    // MARK: - Prefix and Suffix Removal
    
    /// Removes the specified prefix if present.
    /// - Parameter prefix: The prefix to remove.
    /// - Returns: A new string without the prefix.
    func removingPrefix(_ prefix: String) -> String {
        guard hasPrefix(prefix) else { return self }
        return String(dropFirst(prefix.count))
    }
    
    /// Removes the specified suffix if present.
    /// - Parameter suffix: The suffix to remove.
    /// - Returns: A new string without the suffix.
    func removingSuffix(_ suffix: String) -> String {
        guard hasSuffix(suffix) else { return self }
        return String(dropLast(suffix.count))
    }
    
    /// Replaces multiple substrings at once using a dictionary.
    /// - Parameter replacements: A dictionary where keys are substrings to be replaced, and values are the replacements.
    /// - Returns: A new string with all replacements applied.
    func replacingOccurrences(_ replacements: [String: String]) -> String {
        var result = self
        for (target, replacement) in replacements {
            result = result.replacingOccurrences(of: target, with: replacement)
        }
        return result
    }
    
    /// Counts the occurrences of a specific character in the string.
    /// - Parameter character: The character to count.
    /// - Returns: The count of occurrences.
    func countOccurrences(of character: Character) -> Int {
        filter { $0 == character }.count
    }
    
    /// Pads the string to a specified length with a specific character.
    /// - Parameters:
    ///   - character: The character to pad with.
    ///   - length: The desired length.
    /// - Returns: A new string padded to the specified length.
    func leftPad(with character: Character, toLength length: Int) -> String {
        String(repeating: String(character), count: max(0, length - count)) + self
    }
    
    func rightPad(with character: Character, toLength length: Int) -> String {
        self + String(repeating: String(character), count: max(0, length - count))
    }
    
    /// Splits the string into an array of substrings of a given length.
    /// - Parameter length: The length of each substring.
    /// - Returns: An array of substrings.
    func split(into length: Int) -> [String] {
        stride(from: 0, to: count, by: length).map {
            let start = index(startIndex, offsetBy: $0)
            let end = index(start, offsetBy: length, limitedBy: endIndex) ?? endIndex
            return String(self[start..<end])
        }
    }
    
    /// Masks an email address by replacing part of it with asterisks.
    /// - Example: `"email@example.com"` becomes `"e***@example.com"`
    var obfuscatedEmail: String? {
        guard let atIndex = firstIndex(of: "@") else { return nil }
        let namePart = prefix(upTo: atIndex)
        let domainPart = suffix(from: atIndex)
        let maskedName = namePart.prefix(1) + String(repeating: "*", count: max(0, namePart.count - 2)) + namePart.suffix(1)
        return maskedName.appending(domainPart)
    }
}
