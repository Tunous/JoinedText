import XCTest
import SwiftUI
import ViewInspector

@testable import JoinedText

final class TextJoiningTests: XCTestCase {

    func testCanBuildEmptyText() throws {
        let text = Text {}
        try assert(text, hasString: "")
    }

    func testReturnsPassedText() throws {
        let text = Text {
            Text("lonely")
        }
        try assert(text, hasString: "lonely")
    }

    func testDefaultSeparatorIsSpace() throws {
        let text = Text {
            Text("two")
            Text("words")
        }
        try assert(text, hasString: "two words")
    }

    func testCanChangeSeparatorToString() throws {
        let text = Text(separator: "-") {
            Text("joined")
            Text("with")
            Text("dashes")
        }
        try assert(text, hasString: "joined-with-dashes")
    }

    func testCanChangeSeparatorToText() throws {
        let text = Text(separator: Text(" ! ")) {
            Text("exclamation")
            Text("mark")
        }
        try assert(text, hasString: "exclamation ! mark")
    }

    static var allTests = [
        ("testCanBuildEmptyText", testCanBuildEmptyText),
        ("testReturnsPassedText", testReturnsPassedText),
        ("testDefaultSeparatorIsSpace", testDefaultSeparatorIsSpace),
        ("testCanChangeSeparatorToString", testCanChangeSeparatorToString),
        ("testCanChangeSeparatorToText", testCanChangeSeparatorToText),
    ]
}
