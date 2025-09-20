import CoreLibrary

/// Array utility functions
public struct ArrayUtils {

    public init() {}

    /// Finds the sum of array elements
    public func sum(_ numbers: [Int]) -> Int {
        let calculator = Calculator()
        return numbers.reduce(0) { calculator.add($0, $1) }
    }

    /// Finds the maximum value in array
    public func maximum(_ numbers: [Int]) -> Int? {
        guard !numbers.isEmpty else {
            return nil
        }
        return numbers.max()
    }

    /// Filters even numbers from array
    public func filterEven(_ numbers: [Int]) -> [Int] {
        let validator = MathValidator()
        return numbers.filter { validator.isEven($0) }
    }

    /// Filters prime numbers from array
    public func filterPrimes(_ numbers: [Int]) -> [Int] {
        let validator = MathValidator()
        return numbers.filter { validator.isPrime($0) }
    }

    /// Calculates average (returns nil for empty array)
    public func average(_ numbers: [Int]) -> Double? {
        guard !numbers.isEmpty else {
            return nil
        }
        let total = sum(numbers)
        return Double(total) / Double(numbers.count)
    }

    /// Removes duplicates from array
    public func removeDuplicates(_ numbers: [Int]) -> [Int] {
        var seen = Set<Int>()
        var result = [Int]()

        for number in numbers {
            if !seen.contains(number) {
                seen.insert(number)
                result.append(number)
            }
        }

        return result
    }
}