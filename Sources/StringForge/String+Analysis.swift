//
//  String+Analysis.swift
//  StringForge
//
//  Created by Gabriele Pavanello on 07/11/24.
//

import Foundation

public extension String {
    /// Returns the Flesch-Kincaid readability score of the receiver.
    /// SeeAlso: [Flesch-Kincaid readability tests](https://en.wikipedia.org/wiki/Flesch%E2%80%93Kincaid_readability_tests)
    var readabilityScore: Double {
        let words = wordCount
        let sentences = sentenceCount
        
        // Handle the case for empty text
        if words == 0 || sentences == 0 {
            return 0.0
        }
        
        let averageWordsPerSentence = Double(words) / Double(sentences)
        return 206.835 - (1.015 * averageWordsPerSentence) - (84.6 * (averageWordsPerSentence / 100))
    }
    
    /// Returns the Coleman-Liau readability score of the receiver.
    /// - Note: The Coleman-Liau index is a readability test designed to gauge the understandability of a text.
    /// - Returns: The Coleman-Liau readability score of the receiver.
    /// - SeeAlso: [Coleman-Liau index](https://en.wikipedia.org/wiki/Coleman%E2%80%93Liau_index)
    /// - SeeAlso: [Readability tests](https://en.wikipedia.org/wiki/Readability_test)
    var colemanLiauScore: Double {
        let letters = self.filter { $0.isLetter }.count
        let words = wordCount
        let sentences = sentenceCount
        let l = Double(letters) / Double(words) * 100
        let s = Double(sentences) / Double(words) * 100
        return 0.0588 * l - 0.296 * s - 15.8
    }
    
    /// Returns the Automated Readability Index (ARI) of the receiver.
    /// - Note: The Automated Readability Index is a readability test designed to gauge the understandability of a text.
    /// - Returns: The Automated Readability Index (ARI) of the receiver.
    /// - SeeAlso: [Automated Readability Index](https://en.wikipedia.org/wiki/Automated_Readability_Index)
    var automatedReadabilityIndex: Double {
        let characters = self.filter { !$0.isWhitespace }.count
        let words = wordCount
        let sentences = sentenceCount
        let l = Double(characters) / Double(words) * 100
        let s = Double(sentences) / Double(words) * 100
        return 4.71 * l + 0.5 * s - 21.43
    }
    
    /// Returns the Simple Measure of Gobbledygook (SMOG) readability score of the receiver.
    /// - Note: The SMOG index is a readability test designed to gauge the understandability of a text.
    /// - Returns: The Simple Measure of Gobbledygook (SMOG) readability score of the receiver.
    /// - SeeAlso: [Simple Measure of Gobbledygook](https://en.wikipedia.org/wiki/SMOG)
    var smogScore: Double {
        let polysyllables = self.components(separatedBy: .whitespaces).filter { $0.syllableCount > 2 }.count
        let sentences = sentenceCount
        return 1.043 * sqrt(Double(30 * polysyllables) / Double(sentences)) + 3.1291
    }
    
    /// Returns the Gunning Fog Index of the receiver.
    /// - Note: The Gunning Fog Index is a readability test designed to gauge the understandability of a text.
    /// - Returns: The Gunning Fog Index of the receiver.
    /// - SeeAlso: [Gunning fog index](https://en.wikipedia.org/wiki/Gunning_fog_index)
    var gunningFogIndex: Double {
        let complexWords = self.components(separatedBy: .whitespaces).filter { $0.syllableCount > 2 }.count
        let words = wordCount
        let sentences = sentenceCount
        return 0.4 * ((Double(words) / Double(sentences)) + 100 * (Double(complexWords) / Double(words)))
    }
    
    /// Returns the Flesch Reading Ease score of the receiver.
    /// - Note: The Flesch Reading Ease score is a readability test designed to gauge the understandability of a text.
    /// - Returns: The Flesch Reading Ease score of the receiver.
    /// - SeeAlso: [Flesch Reading Ease](https://en.wikipedia.org/wiki/Flesch_reading_ease)
    var fleschReadingEase: Double {
        let words = wordCount
        let sentences = sentenceCount
        let syllables = self.syllableCount
        return 206.835 - 1.015 * (Double(words) / Double(sentences)) - 84.6 * (Double(syllables) / Double(words))
    }
    
    /// Returns the Levenshtein distance between the receiver and a target string.
    /// - Parameter target: The target string to compare against.
    /// - Returns: The Levenshtein distance between the receiver and the target string.
    /// - SeeAlso: [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
    func levenshteinDistance(to target: String) -> Int {
        let sourceArray = Array(self)
        let targetArray = Array(target)
        let m = sourceArray.count
        let n = targetArray.count

        // Edge case: if one of the strings is empty
        if m == 0 { return n }
        if n == 0 { return m }

        // Initialize the matrix with size (m + 1) x (n + 1)
        var matrix = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

        // Populate the first row and column with incremental values
        for i in 0...m { matrix[i][0] = i }
        for j in 0...n { matrix[0][j] = j }

        // Fill in the rest of the matrix
        for i in 1...m {
            for j in 1...n {
                let cost = sourceArray[i - 1] == targetArray[j - 1] ? 0 : 1
                matrix[i][j] = Swift.min(
                    matrix[i - 1][j] + 1,          // Deletion
                    matrix[i][j - 1] + 1,          // Insertion
                    matrix[i - 1][j - 1] + cost    // Substitution
                )
            }
        }

        return matrix[m][n]
    }
    
    /// Returns the Jaccard similarity coefficient between the receiver and a target string.
    /// - Parameter target: The target string to compare against.
    /// - Returns: The Jaccard similarity coefficient between the receiver and the target string.
    /// - SeeAlso: [Jaccard index](https://en.wikipedia.org/wiki/Jaccard_index)
    /// - SeeAlso: [Jaccard similarity coefficient](https://en.wikipedia.org/wiki/Jaccard_similarity_coefficient)
    func jaccardSimilarity(to target: String) -> Double {
        let sourceSet = Set(self)
        let targetSet = Set(target)
        
        let intersection = sourceSet.intersection(targetSet).count
        let union = sourceSet.union(targetSet).count
        
        return union > 0 ? Double(intersection) / Double(union) : 0.0
    }
    
    /// Returns the Hamming distance between the receiver and a target string.
    /// - Parameter target: The target string to compare against.
    /// - Returns: The Hamming distance between the receiver and the target string.
    /// - SeeAlso: [Hamming distance](https://en.wikipedia.org/wiki/Hamming_distance)
    func hammingDistance(to target: String) -> Int {
        let sourceArray = Array(self)
        let targetArray = Array(target)
        return zip(sourceArray, targetArray).reduce(0) { $0 + ($1.0 == $1.1 ? 0 : 1) } + abs(sourceArray.count - targetArray.count)
    }
    
    /// Returns `true` if the receiver passes the Luhn algorithm check
    /// - Note: The Luhn algorithm is used to validate credit card numbers.
    /// - Returns: `true` if the receiver passes the Luhn algorithm check, `false` otherwise.
    /// - SeeAlso: [Luhn algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm)
    func luhnCheck() -> Bool {
        var sum = 0
        let reversedDigits = self.reversed().compactMap { Int(String($0)) }
        
        for (index, digit) in reversedDigits.enumerated() {
            if index % 2 == 1 {
                // Double every second digit and subtract 9 if >9
                let doubled = digit * 2
                sum += (doubled > 9) ? doubled - 9 : doubled
            } else {
                sum += digit
            }
        }
        
        return sum % 10 == 0
    }
}
