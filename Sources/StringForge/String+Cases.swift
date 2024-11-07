//
//  String+Cases.swift
//  StringForge
//
//  Created by Gabriele Pavanello on 06/11/24.
//

import Foundation

public extension String {
    /// Returns a camel-cased version of the string.
    /// - Example: `"hello world"` becomes `"helloWorld"`
    var camelCased: String {
        guard !isEmpty else { return "" }
        let modified = capitalizedWithoutSpaces.withoutSpecialCharacters
        return modified.prefix(1).lowercased() + modified.dropFirst()
    }
    
    /// Returns a snake-cased version of the string.
    /// - Example: `"hello world"` becomes `"hello_world"`
    var snakeCased: String {
        let temp = withoutSpecialCharacters
        return temp.replacingOccurrences(of: "([a-z0-9])([A-Z])", with: "$1_$2", options: .regularExpression).lowercased()
    }
    
    /// Returns a pascal-cased version of the string.
    /// - Example: `"hello world"` becomes `"HelloWorld"`
    var pascalCased: String {
        return capitalizedWithoutSpaces.withoutSpecialCharacters
    }
    
    /// Returns a kebab-cased version of the string.
    /// - Example: `"hello world"` becomes `"hello-world"`
    var kebabCased: String {
        let temp = withoutSpecialCharacters
        return temp.replacingOccurrences(of: "([a-z0-9])([A-Z])", with: "$1-$2", options: .regularExpression).lowercased()
    }
    
    /// Returns a title-cased version of the string, capitalizing key parts of speech.
    /// Lowercases articles, short prepositions, and certain conjunctions unless they are the first or last word.
    /// - Example: `"hello world in swift"` becomes `"Hello World in Swift"`
    var titleCased: String {
        let words = lowercased().split(separator: " ")
        return words.enumerated().map { index, word in
            let shouldCapitalize = index == 0 || !lowercaseWords.contains(word.description)
            return shouldCapitalize ? word.capitalized : word.description
        }.joined(separator: " ")
    }
    
    /// Returns a version of the string with alternating words capitalized.
    /// - Example: `"hello world this is a test"` becomes `"Hello world This is A test"`
    var alternateCased: String {
        return lowercased().split(separator: " ").enumerated().map { index, word in
            index.isMultiple(of: 2) ? word.capitalized : word.description
        }.joined(separator: " ")
    }
    
    /// Returns a slug-cased version of the string.
    var slugCased: String {
        let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
        let withoutSpecialChars = trimmed.lowercased().components(separatedBy: CharacterSet.alphanumerics.inverted).joined(separator: "-")
        let withoutExtraHyphens = withoutSpecialChars.replacingOccurrences(of: "-+", with: "-", options: .regularExpression)
        return withoutExtraHyphens
    }
}

extension String {
    /// A helper set of lowercase words (articles, short prepositions, and conjunctions) that should be lowercased
    /// unless they are the first or last word in a title-cased string.
    private var lowercaseWords: Set<String> {
        return ["a", "an", "the", "and", "but", "or", "nor", "for", "so", "yet", "at", "by", "in", "of", "on", "to", "up", "as"]
    }
    
    /// Returns a new string with each word capitalized and without spaces.
    /// Used as a helper method for camel-cased and pascal-cased transformations.
    private var capitalizedWithoutSpaces: String {
        return split(separator: " ")
            .map { $0.capitalized }
            .joined()
    }
}
