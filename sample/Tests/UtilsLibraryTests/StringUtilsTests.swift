import Testing
@testable import UtilsLibrary

struct StringUtilsTests {

    @Test func testReverse() {
        let utils = StringUtils()
        #expect(utils.reverse("hello") == "olleh")
        #expect(utils.reverse("") == "")
        #expect(utils.reverse("a") == "a")
    }

    @Test func testWordCount() {
        let utils = StringUtils()
        #expect(utils.wordCount("hello world") == 2)
        #expect(utils.wordCount("") == 0)
        #expect(utils.wordCount("   ") == 0)
        #expect(utils.wordCount("single") == 1)
    }

    @Test func testTitleCase() {
        let utils = StringUtils()
        #expect(utils.titleCase("hello world") == "Hello World")
        #expect(utils.titleCase("") == "")
    }

    @Test func testIsPalindrome() {
        let utils = StringUtils()
        #expect(utils.isPalindrome("racecar") == true)
        #expect(utils.isPalindrome("hello") == false)
        #expect(utils.isPalindrome("A man a plan a canal Panama") == true)
    }

    // Note: Not testing factorialDescription to keep coverage partial
}