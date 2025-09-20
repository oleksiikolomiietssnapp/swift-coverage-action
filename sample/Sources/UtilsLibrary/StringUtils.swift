import Foundation
import CoreLibrary

/// String utility functions
public struct StringUtils {

    public init() {}

    /// Reverses a string
    public func reverse(_ string: String) -> String {
        return String(string.reversed())
    }

    /// Counts words in a string
    public func wordCount(_ string: String) -> Int {
        let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            return 0
        }
        return trimmed.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .count
    }

    /// Capitalizes first letter of each word
    public func titleCase(_ string: String) -> String {
        return string.capitalized
    }

    /// Checks if string is a palindrome
    public func isPalindrome(_ string: String) -> Bool {
        let cleaned = string.lowercased().replacingOccurrences(of: " ", with: "")
        return cleaned == reverse(cleaned).lowercased()
    }

    /// Generates a string representation of factorial
    public func factorialDescription(_ number: Int) -> String {
        let validator = MathValidator()
        let calculator = Calculator()

        guard validator.isValidFactorialInput(number) else {
            return "Invalid input for factorial calculation"
        }

        guard let result = calculator.factorial(number) as Int? else {
            return "Calculation error"
        }

        return "\(number)! = \(result)"
    }
}