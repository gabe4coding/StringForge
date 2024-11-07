//
//  StringChecksTests.swift
//  StringForgeTests
//
//  Created by Gabriele Pavanello on 06/11/24.
//

import Testing
@testable import StringForge

@Suite("String Checks")
struct StringChecksTests {

    // MARK: - Basic Type Checks

    @Test func isAlphanumeric() async throws {
        #expect("Hello123".isAlphanumeric == true)
        #expect("Hello 123".isAlphanumeric == false)
        #expect("!@#".isAlphanumeric == false)
        #expect("".isAlphanumeric == false)
    }

    @Test func isAlphabetic() async throws {
        #expect("HelloWorld".isAlphabetic == true)
        #expect("Hello123".isAlphabetic == false)
        #expect("!@#".isAlphabetic == false)
        #expect("".isAlphabetic == false)
    }

    @Test func isNumeric() async throws {
        #expect("123456".isNumeric == true)
        #expect("123.45".isNumeric == false)
        #expect("Hello".isNumeric == false)
        #expect("".isNumeric == false)
    }

    @Test func isUppercased() async throws {
        #expect("HELLO".isUppercased == true)
        #expect("Hello".isUppercased == false)
        #expect("123!".isUppercased == false)
        #expect("".isUppercased == false)
    }

    @Test func isLowercased() async throws {
        #expect("hello".isLowercased == true)
        #expect("Hello".isLowercased == false)
        #expect("123!".isLowercased == false)
        #expect("".isLowercased == false)
    }

    @Test func isPunctuation() async throws {
        #expect(".,!?".isPunctuation == true)
        #expect("Hello!".isPunctuation == false)
        #expect("123!".isPunctuation == false)
        #expect("".isPunctuation == false)
    }

    @Test func isSymbol() async throws {
        #expect("$@#&".isSymbol == true)
        #expect("Hello@World".isSymbol == false)
        #expect("123!".isSymbol == false)
        #expect("".isSymbol == false)
    }

    @Test func isWhitespace() async throws {
        #expect("   ".isWhitespace == true)
        #expect("Hello World".isWhitespace == false)
        #expect("123!".isWhitespace == false)
        #expect("".isWhitespace == false)
    }

    // MARK: - Complex Checks

    @Test func isBool() async throws {
        #expect("true".isBool == true)
        #expect("false".isBool == true)
        #expect("True".isBool == true)
        #expect("hello".isBool == false)
        #expect("".isBool == false)
    }

    @Test func isInt() async throws {
        #expect("123".isInt == true)
        #expect("-123".isInt == true)
        #expect("123.45".isInt == false)
        #expect("abc".isInt == false)
    }

    @Test func isDouble() async throws {
        #expect("123.45".isDouble == true)
        #expect("-123.45".isDouble == true)
        #expect("123".isDouble == true)
        #expect("abc".isDouble == false)
    }

    @Test func isHexColor() async throws {
        #expect("#FF5733".isHexColor == true)
        #expect("FF5733".isHexColor == true)
        #expect("#F53".isHexColor == true)
        #expect("F53".isHexColor == true)
        #expect("#FFG733".isHexColor == false)
    }

    @Test func isStrongPassword() async throws {
        #expect("StrongP@ssw0rd!".isStrongPassword == true)
        #expect("Password123!".isStrongPassword == true)
        #expect("WeakPass".isStrongPassword == false)
        #expect("12345678".isStrongPassword == false)
    }

    @Test func isPalindrome() async throws {
        #expect("madam".isPalindrome == true)
        #expect("racecar".isPalindrome == true)
        #expect("hello".isPalindrome == false)
        #expect("".isPalindrome == false)
    }

    @Test func isValidJSON() async throws {
        #expect("{\"name\": \"John\"}".isValidJSON == true)
        #expect("[1, 2, 3]".isValidJSON == true)
        #expect("Not JSON".isValidJSON == false)
        #expect("{invalid: json}".isValidJSON == false)
    }

    @Test func isEmail() async throws {
        #expect("test@example.com".isEmail == true)
        #expect("test.email@subdomain.example.com".isEmail == true)
        #expect("invalid@com".isEmail == false)
        #expect("test@.com".isEmail == false)
    }

    @Test func isURL() async throws {
        #expect("https://www.example.com".isURL == true)
        #expect("ftp://ftp.example.com".isURL == true)
        #expect("invalid url".isURL == false)
        #expect("example.com".isURL == true)
    }

    // MARK: - IP, MAC, and UUID Checks

    @Test func isIPAddress() async throws {
        #expect("192.168.0.1".isIPAddress == true)
        #expect("2001:0db8:85a3:0000:0000:8a2e:0370:7334".isIPAddress == true)
        #expect("123.456.78.90".isIPAddress == false)
        #expect("abcd::1234".isIPAddress == false)
    }

    @Test func isMACAddress() async throws {
        #expect("00:1A:2B:3C:4D:5E".isMACAddress == true)
        #expect("00-1A-2B-3C-4D-5E".isMACAddress == true)
        #expect("001A2B3C4D5E".isMACAddress == false)
    }

    @Test func isUUID() async throws {
        #expect("123e4567-e89b-12d3-a456-426614174000".isUUID == true)
        #expect("not-a-uuid".isUUID == false)
    }

    // MARK: - Credit Card, Phone, SSN, and Zip Code Validations

    @Test func isPhoneNumber() async throws {
        #expect("(123) 456-7890".isPhoneNumber == true)
        #expect("+1-800-555-0199".isPhoneNumber == true)
        #expect("12345".isPhoneNumber == false)
    }

    @Test func isCreditCardNumber() async throws {
        #expect("4111111111111111".isCreditCardNumber == true)
        #expect("1234567890123456".isCreditCardNumber == false)
    }

    @Test func isCreditCardExpirationDate() async throws {
        #expect("12/25".isCreditCardExpirationDate == true)
        #expect("00/00".isCreditCardExpirationDate == false)
    }

    @Test func isCreditCardCVV() async throws {
        #expect("123".isCreditCardCVV == true)
        #expect("1234".isCreditCardCVV == true)
        #expect("12".isCreditCardCVV == false)
    }

    @Test func isSocialSecurityNumber() async throws {
        #expect("123-45-6789".isSocialSecurityNumber == true)
        #expect("123456789".isSocialSecurityNumber == false)
    }

    @Test func isZipCode() async throws {
        #expect("12345-6789".isZipCode == true)
        #expect("12345".isZipCode == true)
        #expect("1234".isZipCode == false)
    }

    // MARK: - Contains Checks

    @Test func containsEmoji() async throws {
        #expect("Hello 😊".containsEmoji == true)
        #expect("Hello!".containsEmoji == false)
    }

    @Test func containsAlphanumeric() async throws {
        #expect("123abc".containsAlphanumeric == true)
        #expect("!@#".containsAlphanumeric == false)
    }

    @Test func containsAlphabetic() async throws {
        #expect("Hello123".containsAlphabetic == true)
        #expect("123!".containsAlphabetic == false)
    }

    @Test func containsNumeric() async throws {
        #expect("Hello123".containsNumeric == true)
        #expect("Hello!".containsNumeric == false)
    }

    @Test func containsUppercased() async throws {
        #expect("Hello World".containsUppercased == true)
        #expect("hello world".containsUppercased == false)
    }

    @Test func containsLowercased() async throws {
        #expect("Hello World".containsLowercased == true)
        #expect("HELLO WORLD".containsLowercased == false)
    }

    @Test func containsPunctuation() async throws {
        #expect("Hello, World!".containsPunctuation == true)
        #expect("Hello World".containsPunctuation == false)
    }

    @Test func containsSymbol() async throws {
        #expect("Hello @ World!".containsSymbol == true)
        #expect("Hello World".containsSymbol == false)
    }

    @Test func containsWhitespace() async throws {
        #expect("Hello World".containsWhitespace == true)
        #expect("HelloWorld".containsWhitespace == false)
    }
}
