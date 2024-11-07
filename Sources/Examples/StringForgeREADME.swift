//
//  StringForgeREADME.swift
//  StringForge
//
//  Created by Gabriele Pavanello on 07/11/24.
//


import Foundation
import StringForge

@main
struct StringForgeREADME {
    
    static func main() async throws {
        print("Generating README.md file...")
        let readmeContent = StringForgeREADME.generateREADME()
        try readmeContent.write(to: URL(fileURLWithPath: "README.md"), atomically: true, encoding: .utf8)
        print("README.md file generated successfully!")
    }
    
    static func generateREADME() -> String {
        // Title and Introduction
        let title = "StringForge".markdownHeader1
        let description = """
                StringForge is a Swift library crafted to provide powerful and versatile extensions for string manipulation, formatting, validation, detection, encoding, analysis, and more. This library offers a suite of tools that simplify common and complex string operations, making it easier for developers to handle everything from text styling to data extraction.
                
                **Note**: StringForge has been developed with the aid of advanced AI, which contributed to 99% of the code. By leveraging AI-driven assistance, StringForge encapsulates robust functionality and follows modern Swift practices. It serves as an example of how AI can efficiently support code generation for high-quality software libraries.
                """.markdownBlockquote
        
        // Installation Section
        let installationTitle = "Installation".markdownHeader2
        let installationInstructions = """
                To install StringForge using Swift Package Manager (SPM), add the following line to your Package.swift file under dependencies:
                """.markdownItalic
        let spmCode = ".package(url: \"https://github.com/username/StringForge.git\", from: \"1.0.0\")".markdownCodeBlock(language: "swift")
        let installationSection = [installationTitle, installationInstructions, spmCode].joined(separator: "\n\n")
        
        // Features Section
        let featuresTitle = "Features".markdownHeader2
        
        // Text Formatting
        let textFormattingTitle = "Text Formatting".markdownHeader3
        let textFormattingDescription = """
                StringForge provides convenient methods to apply Markdown-compatible formatting to strings. These extensions make it easy to add emphasis, style headers, and structure text, all while ensuring readability in markdown editors.
                """.markdownItalic
        let textFormattingFeatures = [
            "Bold: Formats text as bold".markdownBulletListItem,
            "Italic: Formats text as italic".markdownBulletListItem,
            "Bold and Italic: Formats text as both bold and italic".markdownBulletListItem,
            "Strikethrough: Formats text with a strikethrough".markdownBulletListItem,
            "Headers: Adds header levels from H1 to H6".markdownBulletListItem
        ].joined(separator: "\n")
        
        // Encoding and Decoding
        let encodingTitle = "Encoding and Decoding".markdownHeader3
        let encodingDescription = """
                StringForge supports a variety of encoding schemes to help you transform text data for storage, transmission, or compatibility. It includes methods for URL encoding, Base64 encoding, Hex encoding, HTML encoding, and Binary encoding, as well as their corresponding decoding functions.
                """.markdownItalic
        let encodingFeatures = [
            "URL Encoding and Decoding".markdownBulletListItem,
            "Base64 Encoding and Decoding".markdownBulletListItem,
            "Hex Encoding and Decoding".markdownBulletListItem,
            "HTML Encoding and Decoding".markdownBulletListItem,
            "Binary Encoding and Decoding".markdownBulletListItem
        ].joined(separator: "\n")
        
        // Detection
        let detectionTitle = "Data Detection".markdownHeader3
        let detectionDescription = """
                Detecting data patterns within text can be crucial for tasks such as extracting URLs, phone numbers, or addresses from input. StringForge includes NSDataDetector-based methods for robust data detection, as well as regular expression-based extraction functions for numbers, hashtags, mentions, and more.
                """.markdownItalic
        let detectionFeatures = [
            "URL Extraction: Extracts URLs within text.".markdownBulletListItem,
            "Phone Number Detection".markdownBulletListItem,
            "Address Detection".markdownBulletListItem,
            "Date Detection".markdownBulletListItem,
            "Extracting Numeric, Alphanumeric, Uppercase, Lowercase, Symbols".markdownBulletListItem,
            "HTML Tag Extraction".markdownBulletListItem,
            "File Extension Extraction".markdownBulletListItem,
            "Hashtag and Mention Detection".markdownBulletListItem
        ].joined(separator: "\n")
        
        // Analysis and Metrics
        let analysisTitle = "Text Analysis and Metrics".markdownHeader3
        let analysisDescription = """
                With built-in readability scores and similarity metrics, StringForge makes it easy to analyze and compare text data. Whether you need to gauge readability or measure string similarity, these features help quantify textual properties for further processing or display.
                """.markdownItalic
        let analysisFeatures = [
            "Readability Scores (Flesch-Kincaid, Coleman-Liau, etc.)".markdownBulletListItem,
            "Sentence, Word, and Syllable Counting".markdownBulletListItem,
            "Levenshtein Distance Calculation".markdownBulletListItem,
            "Jaccard Similarity Calculation".markdownBulletListItem,
            "Hamming Distance Calculation".markdownBulletListItem,
            "Luhn Algorithm Check for Validity".markdownBulletListItem
        ].joined(separator: "\n")
        
        // Transformation and Case Conversion
        let transformationTitle = "String Transformation and Case Conversion".markdownHeader3
        let transformationDescription = """
                StringForge offers a suite of case transformation utilities that allow you to adapt strings to various naming conventions, including camelCase, snake_case, PascalCase, kebab-case, and more. Additionally, you can apply transformations to remove spaces, punctuation, and special characters.
                """.markdownItalic
        let transformationFeatures = [
            "Camel Case Conversion".markdownBulletListItem,
            "Snake Case Conversion".markdownBulletListItem,
            "Pascal Case Conversion".markdownBulletListItem,
            "Kebab Case Conversion".markdownBulletListItem,
            "Title Case Conversion".markdownBulletListItem,
            "Slug Case Conversion".markdownBulletListItem,
            "Removing Prefixes and Suffixes".markdownBulletListItem,
            "Extracting and Removing Whitespace and Special Characters".markdownBulletListItem
        ].joined(separator: "\n")
        
        // Static Utilities
        let staticTitle = "Static Utilities".markdownHeader3
        let staticDescription = """
                StringForge includes a range of static utility methods to simplify text-related tasks, from generating Lorem Ipsum placeholder text to quickly constructing URL components for testing or prototyping.
                """.markdownItalic
        let staticFeatures = [
            "Common URL Components".markdownBulletListItem,
            "Common Placeholder Texts (e.g., Lorem Ipsum)".markdownBulletListItem
        ].joined(separator: "\n")
        
        // Aggregate Features
        let featureSections = [
            featuresTitle,
            textFormattingTitle, textFormattingDescription, textFormattingFeatures,
            encodingTitle, encodingDescription, encodingFeatures,
            detectionTitle, detectionDescription, detectionFeatures,
            analysisTitle, analysisDescription, analysisFeatures,
            transformationTitle, transformationDescription, transformationFeatures,
            staticTitle, staticDescription, staticFeatures
        ].joined(separator: "\n\n")
        
        // Putting It All Together
        return [title, description, installationSection, featureSections].joined(separator: "\n\n")
    }
}
