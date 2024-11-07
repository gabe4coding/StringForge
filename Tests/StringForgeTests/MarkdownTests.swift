//
//  MarkdownTests.swift
//  StringForge
//
//  Created by Gabriele Pavanello on 07/11/24.
//

import Testing
@testable import StringForge

@Suite("Markdown")
struct MarkdownTests {
    
    @Test func markdownBold() async throws {
        let string = "Hello, World!"
        let result = string.markdownBold
        let expected = "**Hello, World!**"
        #expect(result == expected)
    }
    
    @Test func markdownItalic() async throws {
        let string = "Hello, World!"
        let result = string.markdownItalic
        let expected = "_Hello, World!_"
        #expect(result == expected)
    }
    
    @Test func markdownBoldItalic() async throws {
        let string = "Hello, World!"
        let result = string.markdownBoldItalic
        let expected = "***Hello, World!***"
        #expect(result == expected)
    }
    
    @Test func markdownStrikethrough() async throws {
        let string = "Hello, World!"
        let result = string.markdownStrikethrough
        let expected = "~~Hello, World!~~"
        #expect(result == expected)
    }
    
    @Test func markdownCode() async throws {
        let string = "Hello, World!"
        let result = string.markdownCode
        let expected = "`Hello, World!`"
        #expect(result == expected)
    }
    
    @Test func markdownHeader1() async throws {
        let string = "Hello, World!"
        let result = string.markdownHeader1
        let expected = "# Hello, World!"
        #expect(result == expected)
    }
    
    @Test func markdownHeader2() async throws {
        let string = "Hello, World!"
        let result = string.markdownHeader2
        let expected = "## Hello, World!"
        #expect(result == expected)
    }
    
    @Test func markdownHeader3() async throws {
        let string = "Hello, World!"
        let result = string.markdownHeader3
        let expected = "### Hello, World!"
        #expect(result == expected)
    }
    
    @Test func markdownHeader4() async throws {
        let string = "Hello, World!"
        let result = string.markdownHeader4
        let expected = "#### Hello, World!"
        #expect(result == expected)
    }
    
    @Test func markdownHeader5() async throws {
        let string = "Hello, World!"
        let result = string.markdownHeader5
        let expected = "##### Hello, World!"
        #expect(result == expected)
    }
    
    @Test func markdownHeader6() async throws {
        let string = "Hello, World!"
        let result = string.markdownHeader6
        let expected = "###### Hello, World!"
        #expect(result == expected)
    }
    
    @Test func markdownBulletListItem() async throws {
        let string = "Hello, World!"
        let result = string.markdownBulletListItem
        let expected = "- Hello, World!"
        #expect(result == expected)
    }
    
    @Test func markdownNumberedListItem() async throws {
        let string = "Hello, World!"
        let result = string.markdownNumberedListItem(at: 1)
        let expected = "1. Hello, World!"
        #expect(result == expected)
    }
    
    @Test func markdownBlockquote() async throws {
        let string = "Hello, World!"
        let result = string.markdownBlockquote
        let expected = "> Hello, World!"
        #expect(result == expected)
    }
    
    @Test func markdownDivider() async throws {
        let result = String.markdownDivider
        let expected = "---"
        #expect(result == expected)
    }
    
    @Test func markdownCodeBlock() async throws {
        let code = "print(\"Hello, World!\")"
        let result = code.markdownCodeBlock(language: "swift")
        let expected = """
        ```swift
        print("Hello, World!")
        ```
        """
        #expect(result == expected)
    }
    
    @Test func markdownLink() async throws {
        let text = "OpenAI"
        let url = "https://openai.com"
        let result = text.markdownLink(url: url)
        let expected = "[OpenAI](https://openai.com)"
        #expect(result == expected)
    }
    
    @Test func markdownImage() async throws {
        let altText = "OpenAI Logo"
        let url = "https://openai.com/logo.png"
        let result = altText.markdownImage(url: url)
        let expected = "![OpenAI Logo](https://openai.com/logo.png)"
        #expect(result == expected)
    }
    
    @Test func markdownBulletList() async throws {
        let items = ["Item 1", "Item 2", "Item 3"]
        let result = String.markdownBulletList(items: items)
        let expected = """
        - Item 1
        - Item 2
        - Item 3
        """
        #expect(result == expected)
    }
    
    @Test func markdownNumberedList() async throws {
        let items = ["First", "Second", "Third"]
        let result = String.markdownNumberedList(items: items)
        let expected = """
        1. First
        2. Second
        3. Third
        """
        #expect(result == expected)
    }
    
    @Test func testMarkdownListUnordered() async throws {
        let items = ["Apple", "Banana", "Cherry"]
        let result = String.markdownList(items: items, ordered: false)
        let expected = """
            - Apple
            - Banana
            - Cherry
            """
        #expect(result == expected)
    }
    
    @Test func testMarkdownListOrdered() async throws {
        let items = ["Apple", "Banana", "Cherry"]
        let result = String.markdownList(items: items, ordered: true)
        let expected = """
            1. Apple
            2. Banana
            3. Cherry
            """
        #expect(result == expected)
    }
    
    @Test func testMarkdownTable() async throws {
        let headers = ["Name", "Age", "City"]
        let rows = [
            ["Alice", "30", "New York"],
            ["Bob", "25", "Los Angeles"],
            ["Charlie", "35", "Chicago"]
        ]
        let result = String.markdownTable(headers: headers, rows: rows)
        let expected = """
            Name | Age | City
            --- | --- | ---
            Alice | 30 | New York
            Bob | 25 | Los Angeles
            Charlie | 35 | Chicago
            """
        #expect(result == expected)
    }
}
