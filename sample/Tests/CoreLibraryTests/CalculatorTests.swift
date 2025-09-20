import Testing
@testable import CoreLibrary

struct CalculatorTests {

    @Test func testAddition() {
        let calculator = Calculator()
        #expect(calculator.add(2, 3) == 5)
        #expect(calculator.add(-1, 1) == 0)
        #expect(calculator.add(0, 0) == 0)
    }

    @Test func testSubtraction() {
        let calculator = Calculator()
        #expect(calculator.subtract(5, 3) == 2)
        #expect(calculator.subtract(1, 1) == 0)
        #expect(calculator.subtract(0, 5) == -5)
    }

    @Test func testMultiplication() {
        let calculator = Calculator()
        #expect(calculator.multiply(3, 4) == 12)
        #expect(calculator.multiply(0, 5) == 0)
        #expect(calculator.multiply(-2, 3) == -6)
    }

    @Test func testDivision() {
        let calculator = Calculator()
        #expect(calculator.divide(10, 2) == 5)
        #expect(calculator.divide(7, 3) == 2)
        #expect(calculator.divide(5, 0) == nil)
    }

    @Test func testFactorial() {
        let calculator = Calculator()
        #expect(calculator.factorial(0) == 1)
        #expect(calculator.factorial(1) == 1)
        #expect(calculator.factorial(5) == 120)
        // Note: Not testing negative numbers or large numbers to keep coverage partial
    }
}