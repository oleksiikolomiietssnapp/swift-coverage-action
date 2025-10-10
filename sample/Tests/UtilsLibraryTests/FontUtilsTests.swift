import Testing
@testable import UtilsLibrary

#if canImport(UIKit) || canImport(AppKit)
struct FontUtilsTests {

    @Test func testValidFontSize() {
        let utils = FontUtils()

        #expect(utils.isValidFontSize(12.0) == true)
        #expect(utils.isValidFontSize(5.0) == false)  // Too small
        #expect(utils.isValidFontSize(150.0) == false)  // Too large
        #expect(utils.isValidFontSize(72.0) == true)
    }

    @Test func testDefaultFontSizes() {
        let utils = FontUtils()

        #expect(utils.defaultSize(for: .caption) == 12.0)
        #expect(utils.defaultSize(for: .body) == 17.0)
        #expect(utils.defaultSize(for: .headline) == 22.0)
        #expect(utils.defaultSize(for: .title) == 28.0)
    }

    // Note: Not testing all edge cases to maintain partial coverage
}
#endif
