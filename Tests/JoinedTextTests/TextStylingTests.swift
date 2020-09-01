//
//  File.swift
//  
//
//  Created by Łukasz Rutkowski on 30/08/2020.
//

import Foundation

import XCTest
import SwiftUI
import ViewInspector

@testable import JoinedText

final class TextStylingTests: XCTestCase {

    func testCanBuildStyledText() throws {
        let text = Text {
            Text("bold").bold()
        }
        let attributes = try text.inspect().text().attributes()
        XCTAssertTrue(try attributes.isBold())
    }

    func testCanCombineStyledText() throws {
        let text = try Text {
            Text("bold").bold()
            Text("italic").italic()
        }.inspect().text()

        let boldSubstring = try text.attributes(forSubstring: "bold")
        XCTAssertTrue(try boldSubstring.isBold())
        XCTAssertThrowsError(try boldSubstring.isItalic())

        let italicSubstring = try text.attributes(forSubstring: "italic")
        XCTAssertTrue(try italicSubstring.isItalic())
        XCTAssertThrowsError(try italicSubstring.isBold())
    }
}

extension InspectableView where View == ViewType.Text {

    func attributes(forSubstring substring: String) throws -> Self.TextAttributes {
        let existingString = try XCTUnwrap(try string())
        let range = try XCTUnwrap(existingString.range(of: substring))
        return try attributes()[range]
    }
}
