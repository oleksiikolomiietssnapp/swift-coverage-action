import Testing
@testable import NetworkLibrary

struct HTTPClientTests {

    @Test func testBuildURL() {
        let client = HTTPClient()

        #expect(client.buildURL(base: "https://api.example.com", path: "users") == "https://api.example.com/users")
        #expect(client.buildURL(base: "http://localhost", path: "data") == "http://localhost/data")
    }

    @Test func testIsValidURL() {
        let client = HTTPClient()

        #expect(client.isValidURL("https://example.com") == true)
        #expect(client.isValidURL("not-a-url") == false)
        #expect(client.isValidURL("") == false)
    }

    @Test func testParseStatusCode() {
        let client = HTTPClient()

        #expect(client.parseStatusCode(200) == "OK")
        #expect(client.parseStatusCode(404) == "Not Found")
    }

    // Note: Not testing buildHeaders and some status codes to maintain ~70% coverage
}
