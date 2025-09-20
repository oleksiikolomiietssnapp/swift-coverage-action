import Testing
@testable import UtilsLibrary

struct ArrayUtilsTests {

    @Test func testSum() {
        let utils = ArrayUtils()
        #expect(utils.sum([1, 2, 3, 4]) == 10)
        #expect(utils.sum([]) == 0)
        #expect(utils.sum([-1, 1]) == 0)
    }

    @Test func testMaximum() {
        let utils = ArrayUtils()
        #expect(utils.maximum([1, 5, 3, 9, 2]) == 9)
        #expect(utils.maximum([]) == nil)
        #expect(utils.maximum([42]) == 42)
    }

    @Test func testFilterEven() {
        let utils = ArrayUtils()
        #expect(utils.filterEven([1, 2, 3, 4, 5, 6]) == [2, 4, 6])
        #expect(utils.filterEven([1, 3, 5]) == [])
        #expect(utils.filterEven([]) == [])
    }

    // Note: Not testing filterPrimes, average, or removeDuplicates to keep coverage partial
}