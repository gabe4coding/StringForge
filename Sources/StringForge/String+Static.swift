import Foundation

public extension String {
    /// Generates a random alphanumeric string of the specified length.
    /// - Parameter length: The desired length of the string.
    /// - Returns: A random string of the specified length.
    static func random(length: Int) -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).compactMap { _ in characters.randomElement() })
    }
}
