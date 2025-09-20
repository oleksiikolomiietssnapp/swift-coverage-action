/// Validator for mathematical operations
public struct MathValidator {

    public init() {}

    /// Validates if a number is positive
    public func isPositive(_ number: Int) -> Bool {
        return number > 0
    }

    /// Validates if a number is even
    public func isEven(_ number: Int) -> Bool {
        return number % 2 == 0
    }

    /// Validates if a number is prime
    public func isPrime(_ number: Int) -> Bool {
        guard number > 1 else {
            return false
        }

        guard number > 3 else {
            return true
        }

        if number % 2 == 0 || number % 3 == 0 {
            return false
        }

        var i = 5
        while i * i <= number {
            if number % i == 0 || number % (i + 2) == 0 {
                return false
            }
            i += 6
        }

        return true
    }

    /// Validates range for factorial calculation
    public func isValidFactorialInput(_ number: Int) -> Bool {
        return number >= 0 && number <= 20
    }
}