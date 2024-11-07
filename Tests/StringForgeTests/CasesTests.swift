import Testing
@testable import StringForge

@Suite("Cases")
struct StringForgeCasesTests {
    @Test func camelCased() async throws {
        let string = "Hello World"
        let result = string.camelCased
        
        let string2 = "Hello, World!"
        let result2 = string2.camelCased
        
        let string3 = "Hello, world!"
        let result3 = string3.camelCased
        
        let expected = "helloWorld"
        
        #expect(result == expected)
        #expect(result2 == expected)
        #expect(result3 == expected)
    }
    
    @Test func snakeCased() async throws {
        let string = "Hello World"
        let result = string.snakeCased
        
        let string2 = "Hello, World!"
        let result2 = string2.snakeCased
        
        let expected = "hello_world"
        
        #expect(result == expected)
        #expect(result2 == expected)
    }
    
    @Test func pascalCased() async throws {
        let string = "Hello World"
        let result = string.pascalCased
        
        let string2 = "Hello, World!"
        let result2 = string2.pascalCased
        
        let string3 = "Hello, world!"
        let result3 = string3.pascalCased
        
        let expected = "HelloWorld"
        
        #expect(result == expected)
        #expect(result2 == expected)
        #expect(result3 == expected)
    }
    
    @Test func kebabCased() async throws {
        let string = "Hello World"
        let result = string.kebabCased
        
        let string2 = "Hello, World!"
        let result2 = string2.kebabCased
        
        let expected = "hello-world"
        
        #expect(result == expected)
        #expect(result2 == expected)
    }
    
    @Test func titleCased() async throws {
        let string = "Hello World this is a test"
        let result = string.titleCased
        
        let string2 = "Hello, world!"
        let result2 = string2.titleCased
        
        let expected = "Hello World This Is a Test"
        let expected2 = "Hello, World!"
        
        #expect(result == expected)
        #expect(result2 == expected2)
    }
    
    @Test func alternateCased() async throws {
        let string = "Hello World this is a test"
        let result = string.alternateCased
        
        let string2 = "Hello, world!"
        let result2 = string2.alternateCased
        
        let expected = "Hello world This is A test"
        let expected2 = "Hello, world!"
        
        #expect(result == expected)
        #expect(result2 == expected2)
    }
    
    @Test func slugCased() async throws {
        let string = "Hello World this is a test"
        let result = string.slugCased
        
        let string2 = "Hello, world!"
        let result2 = string2.slugCased
        
        let expected = "hello-world-this-is-a-test"
        let expected2 = "hello-world-"
        
        #expect(result == expected)
        #expect(result2 == expected2)
    }
}


