//
//  StringForgeTransformationTests.swift
//  StringForge
//
//  Created by Gabriele Pavanello on 06/11/24.
//

import Testing
import Foundation
import SwiftUI
@testable import StringForge

@Suite("Transformation")
struct StringForgeTransformationTests {
    
    @Test func withoutSpaces() async throws {
        let string = "Hello World"
        let result = string.withoutSpaces
        let expected = "HelloWorld"
        #expect(result == expected)
    }

    @Test func withoutSpecialCharacters() async throws {
        let string = "Hello, World!"
        let result = string.withoutSpecialCharacters
        let expected = "HelloWorld"
        #expect(result == expected)
    }

    @Test func withoutSpacesAndSpecialCharacters() async throws {
        let string = " Hello, World! "
        let result = string.withoutSpacesAndSpecialCharacters
        let expected = "HelloWorld"
        #expect(result == expected)
    }
    
    @Test func toInt() async throws {
        let result = "123".toInt
        let expected = 123
        #expect(result == expected)
        
        let invalidResult = "abc".toInt
        #expect(invalidResult == nil)
    }

    @Test func toDouble() async throws {
        let result = "123.45".toDouble
        let expected = 123.45
        #expect(result == expected)
        
        let invalidResult = "abc".toDouble
        #expect(invalidResult == nil)
    }

    @Test func toFloat() async throws {
        let result = "123.45".toFloat
        let expected = Float(123.45)
        #expect(result == expected)
        
        let invalidResult = "abc".toFloat
        #expect(invalidResult == nil)
    }

    @Test func toBool() async throws {
        let trueResult = "true".toBool
        let falseResult = "false".toBool
        let invalidResult = "abc".toBool
        
        #expect(trueResult == true)
        #expect(falseResult == false)
        #expect(invalidResult == nil)
    }

    @Test func toURL() async throws {
        let validURL = "https://www.openai.com".toURL
        let expectedURL = URL(string: "https://www.openai.com")
        #expect(validURL == expectedURL)
        
        let invalidURL = "invalid url".toURL
        
        if #available(macOS 14.0, *) {
            #expect(invalidURL?.absoluteString == "invalid%20url")
        } else {
            #expect(invalidURL == nil)
        }
    }

    @Test func toData() async throws {
        let string = "hello"
        let result = string.toData
        let expected = "hello".data(using: .utf8)
        #expect(result == expected)
    }

    @Test func toUUID() async throws {
        let validUUID = "123e4567-e89b-12d3-a456-426614174000".toUUID
        let expectedUUID = UUID(uuidString: "123e4567-e89b-12d3-a456-426614174000")
        #expect(validUUID == expectedUUID)
        
        let invalidUUID = "invalid-uuid".toUUID
        #expect(invalidUUID == nil)
    }

    
    @Test func removingPrefix() async throws {
        let string = "Hello, World!"
        let result = string.removingPrefix("Hello, ")
        let expected = "World!"
        #expect(result == expected)
    }
    
    @Test func removingSuffix() async throws {
        let string = "Hello, World!"
        let result = string.removingSuffix(" World!")
        let expected = "Hello,"
        #expect(result == expected)
    }
    
    @Test func replacingOccurrences() async throws {
        let string = "Hello, World!"
        let replacements = ["Hello": "Hi", "World": "Everyone"]
        let result = string.replacingOccurrences(replacements)
        let expected = "Hi, Everyone!"
        #expect(result == expected)
    }
    
    @Test func countOccurrencesOfCharacter() async throws {
        let string = "Hello, World!"
        let count = string.countOccurrences(of: "o")
        let expected = 2
        #expect(count == expected)
    }

    @Test func leftPad() async throws {
        let string = "Hello"
        let result = string.leftPad(with: "*", toLength: 10)
        let expected = "*****Hello"
        #expect(result == expected)
    }
    
    @Test func rightPad() async throws {
        let string = "Hello"
        let result = string.rightPad(with: "*", toLength: 10)
        let expected = "Hello*****"
        #expect(result == expected)
    }

    @Test func splitIntoSubstrings() async throws {
        let string = "HelloWorld"
        let result = string.split(into: 3)
        let expected = ["Hel", "loW", "orl", "d"]
        #expect(result == expected)
    }

    @Test func obfuscatedEmail() async throws {
        let email = "email@example.com"
        let result = email.obfuscatedEmail
        let expected = "e***l@example.com"
        #expect(result == expected)
    }
}
