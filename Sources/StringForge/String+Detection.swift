//
//  String+Detection.swift
//  StringForge
//
//  Created by Gabriele Pavanello on 06/11/24.
//

import Foundation

public extension String {
    var extractUrls: [URL] {
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector?.matches(in: self, options: [], range: NSRange(location: 0, length: utf16.count))
        return matches?.compactMap { $0.url } ?? []
    }
    
    var extractPhoneNumbers: [String] {
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
        let matches = detector?.matches(in: self, options: [], range: NSRange(location: 0, length: utf16.count))
        return matches?.compactMap { $0.phoneNumber } ?? []
    }
    
    var extractAddresses: [NSTextCheckingResult] {
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.address.rawValue)
        return detector?.matches(in: self, options: [], range: NSRange(location: 0, length: utf16.count)) ?? []
    }
    
    var extractDates: [Date] {
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.date.rawValue)
        let matches = detector?.matches(in: self, options: [], range: NSRange(location: 0, length: utf16.count))
        return matches?.compactMap { $0.date } ?? []
    }
    
    var extractAlphanumeric: String {
        return components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
    }
    
    var extractAlphabetic: String {
        return components(separatedBy: CharacterSet.letters.inverted).joined()
    }
    
    var extractNumeric: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    var extractNumbers: [String] {
        let regex = try? NSRegularExpression(pattern: "\\d+", options: [])
        let matches = regex?.matches(in: self, range: NSRange(startIndex..., in: self))
        return matches?.compactMap { Range($0.range, in: self).map { String(self[$0]) } } ?? []
    }
    
    var extractUppercased: String {
        return components(separatedBy: CharacterSet.uppercaseLetters.inverted).joined()
    }
    
    var extractLowercased: String {
        return self.filter { character in
            guard let scalar = character.unicodeScalars.first else { return false }
            return CharacterSet.lowercaseLetters.contains(scalar)
        }
    }
    
    var extractPunctuation: String {
        return components(separatedBy: CharacterSet.punctuationCharacters.inverted).joined()
    }
    
    var extractSymbol: String {
        return self.filter { character in
            guard let scalar = character.unicodeScalars.first else { return false }
            return CharacterSet.symbols.union(.punctuationCharacters).contains(scalar)
        }
    }
    
    var extractHTMLTags: [String] {
        let regex = try? NSRegularExpression(pattern: "<[^>]+>", options: [])
        let matches = regex?.matches(in: self, range: NSRange(startIndex..., in: self))
        return matches?.compactMap { Range($0.range, in: self).map { String(self[$0]) } } ?? []
    }
    
    var extractFileExtensions: [String] {
        let regex = try? NSRegularExpression(pattern: "\\.[a-zA-Z0-9]+", options: [])
        let matches = regex?.matches(in: self, range: NSRange(startIndex..., in: self))
        return matches?.compactMap { Range($0.range, in: self).map { String(self[$0].dropFirst()) } } ?? []
    }
    
    var extractHashtags: [String] {
        let regex = try? NSRegularExpression(pattern: "#(\\w+)", options: .caseInsensitive)
        let matches = regex?.matches(in: self, range: NSRange(self.startIndex..., in: self))
        return matches?.compactMap {
            Range($0.range(at: 1), in: self).map { String(self[$0]) }
        } ?? []
    }
    
    var extractMentions: [String] {
        let regex = try? NSRegularExpression(pattern: "@(\\w+)", options: .caseInsensitive)
        let matches = regex?.matches(in: self, range: NSRange(self.startIndex..., in: self))
        return matches?.compactMap {
            Range($0.range(at: 1), in: self).map { String(self[$0]) }
        } ?? []
    }
    
    func extractDates(format: String) -> [Date] {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let words = self.split(separator: " ")
        return words.compactMap { formatter.date(from: String($0)) }
    }
    
    func extractDates(formats: [String]) -> [Date] {
        let formatters = formats.map { format -> DateFormatter in
            let formatter = DateFormatter()
            formatter.dateFormat = format
            return formatter
        }
        
        let words = self.split(separator: " ")
        return words.compactMap { word in
            for formatter in formatters {
                if let date = formatter.date(from: String(word)) {
                    return date
                }
            }
            return nil
        }
    }
    
    /// Returns the word count of the receiver.
    var wordCount: Int {
        return self.split { !$0.isLetter }.count
    }
    
    /// Returns the character count of the receiver.
    var sentenceCount: Int {
        let regex = try? NSRegularExpression(pattern: "[.!?]+", options: .caseInsensitive)
        return regex?.numberOfMatches(in: self, range: NSRange(self.startIndex..., in: self)) ?? 0
    }
    
    /// Returns the syllable count of the receiver.
    var syllableCount: Int {
        let vowels = "aeiouy"
        var count = 0
        var lastWasVowel = false
        for char in lowercased() {
            if vowels.contains(char) {
                if !lastWasVowel {
                    count += 1
                }
                lastWasVowel = true
            } else {
                lastWasVowel = false
            }
        }
        if let lastChar = last {
            if lastChar == "e" {
                count -= 1
            }
        }
        return max(count, 1)
    }
    
    /// Returns the character count of the receiver.
    var vowelCount: Int {
        let vowels = "aeiouAEIOU"
        return filter { vowels.contains($0) }.count
    }

    /// Returns the character count of the receiver.
    var consonantCount: Int {
        let consonants = CharacterSet.letters.subtracting(CharacterSet(charactersIn: "aeiouAEIOU"))
        return unicodeScalars.filter { consonants.contains($0) }.count
    }
}
