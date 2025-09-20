/// A simple calculator for demonstrating code coverage
public struct Calculator {

    public init() {}

    /// Adds two numbers
    public func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }

    /// Subtracts two numbers
    public func subtract(_ a: Int, _ b: Int) -> Int {
        return a - b
    }

    /// Multiplies two numbers
    public func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }

    /// Divides two numbers
    public func divide(_ a: Int, _ b: Int) -> Int? {
        guard b != 0 else {
            return nil
        }
        return a / b
    }

    /// Calculates factorial (recursive)
    public func factorial(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        return n * factorial(n - 1)
    }
}