//
//  StringAnalysisTests.swift
//  StringForgeTests
//
//  Created by Gabriele Pavanello on 07/11/24.
//

import Testing
@testable import StringForge

@Suite("String Analysis")
struct StringAnalysisTests {

    // MARK: - Readability Scores

    @Test func readabilityScore() async throws {
        let text = "This is a simple test sentence for readability analysis."
        let result = text.readabilityScore
        #expect(result > 0)  // We expect a positive score, but we can further refine this based on expected values
    }

    @Test func colemanLiauScore() async throws {
        let text = "This is another test sentence to measure readability."
        let result = text.colemanLiauScore
        #expect(result > 0)
    }

    @Test func automatedReadabilityIndex() async throws {
        let text = "Testing the Automated Readability Index with this sentence."
        let result = text.automatedReadabilityIndex
        #expect(result > 0)
    }

    @Test func smogScore() async throws {
        let text = "A more complex sentence that might affect the SMOG score calculation."
        let result = text.smogScore
        #expect(result > 0)
    }

    @Test func gunningFogIndex() async throws {
        let text = "A sentence with some complexity and polysyllabic words for testing."
        let result = text.gunningFogIndex
        #expect(result > 0)
    }

    @Test func fleschReadingEase() async throws {
        let text = "The Flesch Reading Ease score is calculated using this sentence."
        let result = text.fleschReadingEase
        #expect(result > 0)
    }

    // MARK: - Distance and Similarity Measures

    @Test func levenshteinDistance() async throws {
        let source = "kitten"
        let target = "sitting"
        let result = source.levenshteinDistance(to: target)
        let expected = 3
        #expect(result == expected)
    }

    @Test func jaccardSimilarity() async throws {
        let source = "night"
        let target = "nacht"
        let result = source.jaccardSimilarity(to: target)
        let expected = 0.4286  // Updated expected value based on correct calculation
        let tolerance = 0.001
        #expect(abs(result - expected) < tolerance, "Expected Jaccard similarity did not match")
    }

    @Test func hammingDistance() async throws {
        let source = "karolin"
        let target = "kathrin"
        let result = source.hammingDistance(to: target)
        let expected = 3
        #expect(result == expected)
        
        // Edge case where lengths differ
        let differingLengthSource = "hello"
        let differingLengthTarget = "helloworld"
        let differingResult = differingLengthSource.hammingDistance(to: differingLengthTarget)
        let expectedDifferingResult = abs(differingLengthSource.count - differingLengthTarget.count)
        #expect(differingResult == expectedDifferingResult)
    }

    // MARK: - Luhn Algorithm Check

    @Test func luhnCheck() async throws {
        let validCreditCard = "4532015112830366"  // Example Visa number for testing
        let invalidCreditCard = "1234567890123456"
        
        #expect(validCreditCard.luhnCheck() == true)
        #expect(invalidCreditCard.luhnCheck() == false)
    }

    // MARK: - Edge Cases and Boundary Testing

    @Test func readabilityScore_emptyText() async throws {
        let text = ""
        let result = text.readabilityScore
        #expect(result == 0)  // Expecting 0 or minimal value for empty text
    }

    @Test func levenshteinDistance_emptyText() async throws {
        let source = ""
        let target = "hello"
        let result = source.levenshteinDistance(to: target)
        let expected = target.count  // Distance should be the length of the non-empty string
        #expect(result == expected)
    }

    @Test func hammingDistance_emptyText() async throws {
        let source = ""
        let target = "hello"
        let result = source.hammingDistance(to: target)
        let expected = target.count
        #expect(result == expected)
    }

    @Test func jaccardSimilarity_identicalText() async throws {
        let text = "test"
        let result = text.jaccardSimilarity(to: text)
        let expected = 1.0  // Identical texts should have a similarity of 1.0
        #expect(result == expected)
    }
}
