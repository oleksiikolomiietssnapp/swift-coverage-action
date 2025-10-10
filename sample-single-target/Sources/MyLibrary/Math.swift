public struct Math {
    public init() {}

    public func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }

    public func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }

    public func divide(_ a: Int, _ b: Int) -> Int? {
        guard b != 0 else { return nil }
        return a / b
    }
}
