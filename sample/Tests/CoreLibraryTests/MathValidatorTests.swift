import Testing
@testable import CoreLibrary

struct MathValidatorTests {

    @Test func testIsPositive() {
        let validator = MathValidator()
        #expect(validator.isPositive(5) == true)
        #expect(validator.isPositive(0) == false)
        #expect(validator.isPositive(-3) == false)
    }

    @Test func testIsEven() {
        let validator = MathValidator()
        #expect(validator.isEven(4) == true)
        #expect(validator.isEven(3) == false)
        #expect(validator.isEven(0) == true)
    }

    @Test func testIsPrime() {
        let validator = MathValidator()
        #expect(validator.isPrime(2) == true)
        #expect(validator.isPrime(3) == true)
        #expect(validator.isPrime(4) == false)
        #expect(validator.isPrime(17) == true)
        // Note: Not testing all edge cases to keep coverage partial
    }

    @Test func testValidFactorialInput() {
        let validator = MathValidator()
        #expect(validator.isValidFactorialInput(5) == true)
        #expect(validator.isValidFactorialInput(20) == true)
        #expect(validator.isValidFactorialInput(-1) == false)
        // Note: Not testing upper bound to keep coverage partial
    }
}
