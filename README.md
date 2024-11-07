# StringForge

> StringForge is a Swift library crafted to provide powerful and versatile extensions for string manipulation, formatting, validation, detection, encoding, analysis, and more. This library offers a suite of tools that simplify common and complex string operations, making it easier for developers to handle everything from text styling to data extraction.

**Note**: StringForge has been developed with the aid of advanced AI, which contributed to 99% of the code. By leveraging AI-driven assistance, StringForge encapsulates robust functionality and follows modern Swift practices. It serves as an example of how AI can efficiently support code generation for high-quality software libraries.

## Installation

_To install StringForge using Swift Package Manager (SPM), add the following line to your Package.swift file under dependencies:_

```swift
.package(url: "https://github.com/username/StringForge.git", from: "1.0.0")
```

## Features

### Text Formatting

_StringForge provides convenient methods to apply Markdown-compatible formatting to strings. These extensions make it easy to add emphasis, style headers, and structure text, all while ensuring readability in markdown editors._

- Bold: Formats text as bold
- Italic: Formats text as italic
- Bold and Italic: Formats text as both bold and italic
- Strikethrough: Formats text with a strikethrough
- Headers: Adds header levels from H1 to H6

### Encoding and Decoding

_StringForge supports a variety of encoding schemes to help you transform text data for storage, transmission, or compatibility. It includes methods for URL encoding, Base64 encoding, Hex encoding, HTML encoding, and Binary encoding, as well as their corresponding decoding functions._

- URL Encoding and Decoding
- Base64 Encoding and Decoding
- Hex Encoding and Decoding
- HTML Encoding and Decoding
- Binary Encoding and Decoding

### Data Detection

_Detecting data patterns within text can be crucial for tasks such as extracting URLs, phone numbers, or addresses from input. StringForge includes NSDataDetector-based methods for robust data detection, as well as regular expression-based extraction functions for numbers, hashtags, mentions, and more._

- URL Extraction: Extracts URLs within text.
- Phone Number Detection
- Address Detection
- Date Detection
- Extracting Numeric, Alphanumeric, Uppercase, Lowercase, Symbols
- HTML Tag Extraction
- File Extension Extraction
- Hashtag and Mention Detection

### Text Analysis and Metrics

_With built-in readability scores and similarity metrics, StringForge makes it easy to analyze and compare text data. Whether you need to gauge readability or measure string similarity, these features help quantify textual properties for further processing or display._

- Readability Scores (Flesch-Kincaid, Coleman-Liau, etc.)
- Sentence, Word, and Syllable Counting
- Levenshtein Distance Calculation
- Jaccard Similarity Calculation
- Hamming Distance Calculation
- Luhn Algorithm Check for Validity

### String Transformation and Case Conversion

_StringForge offers a suite of case transformation utilities that allow you to adapt strings to various naming conventions, including camelCase, snake_case, PascalCase, kebab-case, and more. Additionally, you can apply transformations to remove spaces, punctuation, and special characters._

- Camel Case Conversion
- Snake Case Conversion
- Pascal Case Conversion
- Kebab Case Conversion
- Title Case Conversion
- Slug Case Conversion
- Removing Prefixes and Suffixes
- Extracting and Removing Whitespace and Special Characters

### Static Utilities

_StringForge includes a range of static utility methods to simplify text-related tasks, from generating Lorem Ipsum placeholder text to quickly constructing URL components for testing or prototyping._

- Common URL Components
- Common Placeholder Texts (e.g., Lorem Ipsum)