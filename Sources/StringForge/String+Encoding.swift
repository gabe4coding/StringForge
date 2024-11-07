//
//  String+Encoding.swift
//  StringForge
//
//  Created by Gabriele Pavanello on 06/11/24.
//

import Foundation

public extension String {
    /// Returns an url-encoded version of the string.
    var urlEncoded: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
    /// Returns an url-decoded version of the string.
    var urlDecoded: String {
        return self.removingPercentEncoding ?? self
    }
    
    /// Returns a base64-encoded version of the string.
    var base64Encoded: String {
        return data(using: .utf8)?.base64EncodedString() ?? self
    }
    
    /// Returns a base64-decoded version of the string.
    var base64Decoded: String {
        guard let data = Data(base64Encoded: self) else { return self }
        return String(data: data, encoding: .utf8) ?? self
    }
    
    /// Returns a hex-encoded version of the string.
    var hexEncoded: String {
        return unicodeScalars.map { String(format: "%02X", $0.value) }.joined()
    }
    
    /// Returns a hex-decoded version of the string.
    var hexDecoded: String {
        var result = ""
        var index = self.startIndex
        while index < self.endIndex {
            let nextIndex = self.index(index, offsetBy: 2)
            let byte = self[index..<nextIndex]
            if let char = UInt8(byte, radix: 16) {
                result.append(Character(UnicodeScalar(char)))
            } else {
                result.append(contentsOf: byte)
            }
            index = nextIndex
        }
        return result
    }
    
    /// Returns a rot13-encoded version of the string.
    var rot13Encoded: String {
        let transform = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        let rot13 = "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm"
        return self.map {
            if let index = transform.firstIndex(of: $0) {
                return rot13[rot13.index(rot13.startIndex, offsetBy: transform.distance(from: transform.startIndex, to: index))]
            }
            return $0
        }.map { String($0) }.joined()
    }
    
    /// Returns an html-encoded version of the string.
    var htmlEncoded: String {
        let entities: [String: String] = [
            "&": "&amp;", "<": "&lt;", ">": "&gt;", "\"": "&quot;", "'": "&apos;"
        ]
        return self.reduce(into: "") { result, character in
            let stringChar = String(character)
            result += entities[stringChar] ?? stringChar
        }
    }
    
    /// Returns an html-decoded version of the string.
    var htmlDecoded: String {
        let entities: [String: String] = [
            "&amp;": "&", "&lt;": "<", "&gt;": ">", "&quot;": "\"", "&apos;": "'"
        ]
        var result = self
        for (entity, character) in entities {
            result = result.replacingOccurrences(of: entity, with: character)
        }
        return result
    }
    
    /// Returns a binary-encoded version of the string.
    var binaryEncoded: String {
        return self.utf8.map { String($0, radix: 2).leftPadded(toLength: 8, withPad: "0") }.joined(separator: " ")
    }
        
    /// Returns a binary-decoded version of the string.
    var binaryDecoded: String? {
        let binaryValues = self.split(separator: " ")
        var data = Data()
        for binary in binaryValues {
            if let byte = UInt8(binary, radix: 2) {
                data.append(byte)
            } else {
                return nil
            }
        }
        return String(data: data, encoding: .utf8)
    }
}

extension String {
    func leftPadded(toLength: Int, withPad character: Character) -> String {
        let padding = String(repeating: String(character), count: max(0, toLength - count))
        return padding + self
    }
}
