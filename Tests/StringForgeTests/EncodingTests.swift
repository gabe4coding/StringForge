//
//  EncodingTests.swift
//  StringForge
//
//  Created by Gabriele Pavanello on 06/11/24.
//

import Testing
@testable import StringForge

@Suite("Encoding")
struct StringForgeEncodingTests {
    @Test func urlEncoded() async throws {
        let string = "Hello, World!"
        let result = string.urlEncoded
        let expected = "Hello,%20World!"
        #expect(result == expected)
    }
    
    @Test func urlDecoded() async throws {
        let string = "Hello,%20World!"
        let result = string.urlDecoded
        let expected = "Hello, World!"
        #expect(result == expected)
    }
    
    @Test func base64Encoded() async throws {
        let string = "Hello, World!"
        let result = string.base64Encoded
        let expected = "SGVsbG8sIFdvcmxkIQ=="
        #expect(result == expected)
    }
    
    @Test func base64Decoded() async throws {
        let string = "SGVsbG8sIFdvcmxkIQ=="
        let result = string.base64Decoded
        let expected = "Hello, World!"
        #expect(result == expected)
    }
    
    @Test func hexEncoded() async throws {
        let string = "Hello, World!"
        let result = string.hexEncoded
        let expected = "48656c6c6f2c20576f726c6421".uppercased()
        #expect(result == expected)
    }
    
    @Test func hexDecoded() async throws {
        let string = "48656c6c6f2c20576f726c6421".uppercased()
        let result = string.hexDecoded
        let expected = "Hello, World!"
        #expect(result == expected)
    }
    
    @Test func rot13Encoded() async throws {
        let string = "Hello, World!"
        let result = string.rot13Encoded
        let expected = "Uryyb, Jbeyq!"
        #expect(result == expected)
    }
    
    @Test func htmlEncoded() async throws {
        let string = "Hello, <World> & \"Swift\"!"
        let result = string.htmlEncoded
        let expected = "Hello, &lt;World&gt; &amp; &quot;Swift&quot;!"
        #expect(result == expected, "Expected HTML encoded string did not match")
    }

    @Test func htmlDecoded() async throws {
        let string = "Hello, &lt;World&gt; &amp; &quot;Swift&quot;!"
        let result = string.htmlDecoded
        let expected = "Hello, <World> & \"Swift\"!"
        #expect(result == expected, "Expected HTML decoded string did not match")
    }
    
    @Test func binaryEncoded() async throws {
        let string = "Hello, World!"
        let result = string.binaryEncoded
        let expected = "01001000 01100101 01101100 01101100 01101111 00101100 00100000 01010111 01101111 01110010 01101100 01100100 00100001"
        #expect(result == expected)
    }
    
    @Test func binaryDecoded() async throws {
        let string = "01001000 01100101 01101100 01101100 01101111 00101100 00100000 01010111 01101111 01110010 01101100 01100100 00100001"
        let result = string.binaryDecoded
        let expected = "Hello, World!"
        #expect(result == expected)
    }
}

