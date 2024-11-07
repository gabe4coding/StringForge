//
//  StringDetectionTests.swift
//  StringForge
//
//  Created by Gabriele Pavanello on 06/11/24.
//

import Testing
import Foundation
@testable import StringForge

@Suite("Detection")
struct StringForgeDetectionTests {

    @Test func extractUrls() async throws {
        let string = "Visit us at https://openai.com and https://github.com!"
        let result = string.extractUrls
        let expected = [URL(string: "https://openai.com")!, URL(string: "https://github.com")!]
        #expect(result == expected)
    }

    @Test func extractPhoneNumbers() async throws {
        let string = "Contact us at +1-800-555-0199 or (555) 123-4567."
        let result = string.extractPhoneNumbers
        let expected = ["+1-800-555-0199", "(555) 123-4567"]
        #expect(result == expected)
    }

    @Test func extractAddresses() async throws {
        let string = "123 Main St, Springfield, IL 62701"
        let result = string.extractAddresses
        #expect(result.count > 0, "Expected at least one address to be detected")
    }

    @Test func extractDates() async throws {
        let string = "The meeting is on 2023-11-07 and the follow-up is on 11/08/2023."
        let result = string.extractDates
        #expect(result.count == 2)
    }

    @Test func extractAlphanumeric() async throws {
        let string = "Hello, World! 123"
        let result = string.extractAlphanumeric
        let expected = "HelloWorld123"
        #expect(result == expected)
    }

    @Test func extractAlphabetic() async throws {
        let string = "Hello, World! 123"
        let result = string.extractAlphabetic
        let expected = "HelloWorld"
        #expect(result == expected)
    }

    @Test func extractNumeric() async throws {
        let string = "Phone: 123-456-7890"
        let result = string.extractNumeric
        let expected = "1234567890"
        #expect(result == expected)
    }

    @Test func extractNumbers() async throws {
        let string = "Order 12 items for $34.56 each."
        let result = string.extractNumbers
        let expected = ["12", "34", "56"]
        #expect(result == expected)
    }

    @Test func extractUppercased() async throws {
        let string = "Hello, WORLD!"
        let result = string.extractUppercased
        let expected = "HWORLD"
        #expect(result == expected)
    }

    @Test func extractLowercased() async throws {
        let string = "Hello, WORLD!"
        let result = string.extractLowercased
        let expected = "ello"
        #expect(result == expected)
    }

    @Test func extractPunctuation() async throws {
        let string = "Hello, World! How's it going?"
        let result = string.extractPunctuation
        let expected = ",!'?"
        #expect(result == expected)
    }

    @Test func extractSymbol() async throws {
        let string = "Price: $100 @ Store #123"
        let result = string.extractSymbol
        let expected = ":$@#"
        #expect(result == expected)
    }

    @Test func extractHTMLTags() async throws {
        let string = "<p>Hello, <strong>World</strong>!</p>"
        let result = string.extractHTMLTags
        let expected = ["<p>", "<strong>", "</strong>", "</p>"]
        #expect(result == expected)
    }

    @Test func extractFileExtensions() async throws {
        let string = "Document.docx and Image.png"
        let result = string.extractFileExtensions
        let expected = ["docx", "png"]
        #expect(result == expected)
    }

    @Test func extractHashtags() async throws {
        let string = "Follow #OpenAI and #AI on social media."
        let result = string.extractHashtags
        let expected = ["OpenAI", "AI"]
        #expect(result == expected)
    }

    @Test func extractMentions() async throws {
        let string = "Hello @User1 and @User2!"
        let result = string.extractMentions
        let expected = ["User1", "User2"]
        #expect(result == expected)
    }

    @Test func extractDatesWithFormat() async throws {
        let string = "2023-11-07 11/08/2023"
        let result = string.extractDates(format: "yyyy-MM-dd")
        #expect(result.count == 1)
    }

    @Test func extractDatesWithFormats() async throws {
        let string = "2023-11-07 and 11/08/2023"
        let result = string.extractDates(formats: ["yyyy-MM-dd", "MM/dd/yyyy"])
        #expect(result.count == 2)
    }

    @Test func wordCount() async throws {
        let string = "Hello, World! This is a test."
        let result = string.wordCount
        let expected = 6
        #expect(result == expected)
    }

    @Test func sentenceCount() async throws {
        let string = "Hello, World! How are you? This is a test."
        let result = string.sentenceCount
        let expected = 3
        #expect(result == expected)
    }

    @Test func syllableCount() async throws {
        let string = "Hello, World!"
        let result = string.syllableCount
        let expected = 3
        #expect(result == expected)
    }

    @Test func vowelCount() async throws {
        let string = "Hello, World!"
        let result = string.vowelCount
        let expected = 3
        #expect(result == expected)
    }

    @Test func consonantCount() async throws {
        let string = "Hello, World!"
        let result = string.consonantCount
        let expected = 7
        #expect(result == expected)
    }
}
