import XCTest
@testable import SPM_Example

final class SPM_ExampleTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SPM_Example().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
