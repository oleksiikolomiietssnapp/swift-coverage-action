import Testing
@testable import UtilsLibrary

#if canImport(UIKit) || canImport(AppKit)
struct FontUtilsTests {

    @Test func testSystemFont() {
        let utils = FontUtils()
        let font = utils.systemFont(size: 16.0)

        #expect(font != nil)
        if let font = font {
            #expect(utils.fontSize(from: font) == 16.0)
        }
    }

    @Test func testBoldSystemFont() {
        let utils = FontUtils()
        let font = utils.boldSystemFont(size: 18.0)

        #expect(font != nil)
        if let font = font {
            #expect(utils.fontSize(from: font) == 18.0)
            #expect(utils.isBold(font) == true)
        }
    }

    @Test func testFontSizeExtraction() {
        let utils = FontUtils()
        let font = utils.systemFont(size: 24.0)

        #expect(font != nil)
        if let font = font {
            #expect(utils.fontSize(from: font) == 24.0)
        }
    }

    @Test func testFontComparison() {
        let utils = FontUtils()
        let font1 = utils.systemFont(size: 16.0)
        let font2 = utils.systemFont(size: 16.0)
        let font3 = utils.systemFont(size: 20.0)

        #expect(font1 != nil)
        #expect(font2 != nil)
        #expect(font3 != nil)

        if let font1 = font1, let font2 = font2, let font3 = font3 {
            #expect(utils.areEqual(font1, font2) == true)
            #expect(utils.areEqual(font1, font3) == false)
        }
    }

    @Test func testFontScaling() {
        let utils = FontUtils()
        let originalFont = utils.systemFont(size: 16.0)

        #expect(originalFont != nil)
        if let originalFont = originalFont {
            let scaledFont = utils.scale(originalFont, to: 20.0)
            #expect(scaledFont != nil)

            if let scaledFont = scaledFont {
                #expect(utils.fontSize(from: scaledFont) == 20.0)
                // Compare family names handling optionals
                let originalFamily = utils.familyName(from: originalFont)
                let scaledFamily = utils.familyName(from: scaledFont)
                #expect(originalFamily == scaledFamily)
            }
        }
    }

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

    @Test func testFamilyName() throws {
        let utils = FontUtils()
        let font = utils.systemFont(size: 16.0)

        #expect(font != nil)
        if let font = font {
            let familyName = try #require(utils.familyName(from: font))
            #expect(!familyName.isEmpty)
            // System font family name varies by platform but should always be non-empty
        }
    }

    // Note: Not testing all edge cases to maintain partial coverage
}
#endif
