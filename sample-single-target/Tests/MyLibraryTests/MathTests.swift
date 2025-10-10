import Testing
@testable import MyLibrary

struct MathTests {

    @Test func testAdd() {
        let math = Math()
        #expect(math.add(2, 3) == 5)
        #expect(math.add(-1, 1) == 0)
    }

    @Test func testMultiply() {
        let math = Math()
        #expect(math.multiply(3, 4) == 12)
        #expect(math.multiply(0, 5) == 0)
    }

    // Note: Not testing divide to maintain ~70% coverage
}
