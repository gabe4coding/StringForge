//
//  String+Markdown.swift
//  StringForge
//
//  Created by Gabriele Pavanello on 07/11/24.
//

import Foundation

public extension String {
    // MARK: - Basic Text Formatting
    
    /// Returns a markdown bold version of the string.
    var markdownBold: String { "**\(self)**" }
    
    /// Returns a markdown italic version of the string.
    var markdownItalic: String { "_\(self)_" }
    
    /// Returns a markdown bold and italic version of the string.
    var markdownBoldItalic: String { "***\(self)***" }
    
    /// Returns a markdown strikethrough version of the string.
    var markdownStrikethrough: String { "~~\(self)~~" }
    
    /// Returns a markdown inline code version of the string.
    var markdownCode: String { "`\(self)`" }
    
    // MARK: - Headers
    
    /// Returns a markdown H1 header version of the string.
    var markdownHeader1: String { "# \(self)" }
    
    /// Returns a markdown H2 header version of the string.
    var markdownHeader2: String { "## \(self)" }
    
    /// Returns a markdown H3 header version of the string.
    var markdownHeader3: String { "### \(self)" }
    
    /// Returns a markdown H4 header version of the string.
    var markdownHeader4: String { "#### \(self)" }
    
    /// Returns a markdown H5 header version of the string.
    var markdownHeader5: String { "##### \(self)" }
    
    /// Returns a markdown H6 header version of the string.
    var markdownHeader6: String { "###### \(self)" }
    
    // MARK: - Lists
    
    /// Returns the string formatted as a markdown bullet list item.
    var markdownBulletListItem: String { "- \(self)" }
    
    /// Returns the string formatted as a numbered list item.
    /// - Parameter index: The number to prefix the item with.
    func markdownNumberedListItem(at index: Int) -> String {
        "\(index). \(self)"
    }
    
    // MARK: - Blockquote and Divider
    
    /// Returns the string formatted as a markdown blockquote.
    var markdownBlockquote: String { "> \(self)" }
    
    /// Returns a markdown horizontal rule.
    static var markdownDivider: String { "---" }
    
    // MARK: - Code Blocks
    
    /// Returns the string formatted as a markdown code block.
    /// - Parameter language: The language for syntax highlighting (e.g., "swift", "javascript").
    func markdownCodeBlock(language: String = "") -> String {
        "```\(language)\n\(self)\n```"
    }
    
    // MARK: - Links and Images
    
    /// Returns the string formatted as a markdown link.
    /// - Parameter url: The URL for the link.
    func markdownLink(url: String) -> String {
        "[\(self)](\(url))"
    }
    
    /// Returns the string formatted as a markdown image.
    /// - Parameter url: The URL for the image.
    func markdownImage(url: String) -> String {
        "![\(self)](\(url))"
    }
    
    // MARK: - Combining Multiple Lines
    
    /// Joins an array of strings as a markdown bullet list.
    static func markdownBulletList(items: [String]) -> String {
        items.map { "- \($0)" }.joined(separator: "\n")
    }
    
    /// Joins an array of strings as a markdown numbered list.
    static func markdownNumberedList(items: [String]) -> String {
        items.enumerated().map { "\($0 + 1). \($1)" }.joined(separator: "\n")
    }
    
    /// Formats the string as a Markdown code block with optional syntax highlighting.
    /// - Parameter language: The programming language for syntax highlighting (e.g., "swift", "javascript").
    /// - Returns: A string formatted as a Markdown code block with syntax highlighting.
    func prettifiedCode(language: String = "") -> String {
        "```\(language)\n\(self)\n```"
    }
    
    // Formats a single-line Swift-like function into a multi-line, prettified code block with indentation.
    /// - Parameters:
    ///   - language: The programming language for syntax highlighting (default is "swift").
    ///   - indentWidth: The number of spaces for each indentation level.
    /// - Returns: A prettified, multi-line version of the code in a Markdown code block.
    func prettifiedCode(language: String = "swift", indentWidth: Int = 4) -> String {
        let indent = String(repeating: " ", count: indentWidth)
        
        // Basic transformations for prettifying Swift-like syntax
        var prettified = self
            .replacingOccurrences(of: "{", with: " {\n\(indent)")
            .replacingOccurrences(of: "}", with: "\n}")
            .replacingOccurrences(of: ";", with: ";\n\(indent)") // For lines with multiple statements
            .replacingOccurrences(of: "(", with: "(\n\(indent)")
            .replacingOccurrences(of: ")", with: "\n)")
        
        // Clean up any extra indentation or spacing after transformations
        prettified = prettified
            .components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .joined(separator: "\n")
        
        // Wrap in a Markdown code block with the specified language
        return "```\(language)\n\(prettified)\n```"
    }
        
    /// Markdown List Generation
    static func markdownList(items: [String], ordered: Bool = false) -> String {
        return items.enumerated().map { index, item in
            ordered ? "\(index + 1). \(item)" : "- \(item)"
        }.joined(separator: "\n")
    }
    
    /// Markdown Table
    static func markdownTable(headers: [String], rows: [[String]]) -> String {
        let headerLine = headers.joined(separator: " | ")
        let separatorLine = headers.map { _ in "---" }.joined(separator: " | ")
        let rowLines = rows.map { $0.joined(separator: " | ") }
        return ([headerLine, separatorLine] + rowLines).joined(separator: "\n")
    }
}
