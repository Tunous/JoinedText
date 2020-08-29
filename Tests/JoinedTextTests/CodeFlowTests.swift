//
//  File.swift
//  
//
//  Created by Łukasz Rutkowski on 29/08/2020.
//

import XCTest
import SwiftUI
import ViewInspector

final class CodeFlowTests: XCTestCase {

    func testCanUseIfWithPositiveResult() throws {
        let condition = true
        let text = Text {
            if condition {
                Text("true")
            }
            Text("default")
        }
        try assert(text, hasString: "true default")
    }

    func testCanUseIfWithNegativeResult() throws {
        let condition = false
        let text = Text {
            if condition {
                Text("true")
            }
            Text("default")
        }
        try assert(text, hasString: "default")
    }

    func testCanUseIfElseWithPositiveResult() throws {
        let condition = true
        let text = Text {
            if condition {
                Text("true")
            } else {
                Text("false")
            }
            Text("default")
        }
        try assert(text, hasString: "true default")
    }

    func testCanUseIfElseWithNegativeResult() throws {
        let condition = false
        let text = Text {
            if condition {
                Text("true")
            } else {
                Text("false")
            }
            Text("default")
        }
        try assert(text, hasString: "false default")
    }

    func testCanUseIfLetWithPositiveResult() throws {
        let optional: String? = "found"
        let text = Text {
           if let found = optional {
               Text(found)
           } else {
               Text("not found")
           }
        }
        try assert(text, hasString: "found")
    }

    func testCanUseIfLetWithNegativeResult() throws {
        let optional: String? = nil
        let text = Text {
           if let found = optional {
               Text(found)
           } else {
               Text("not found")
           }
        }
        try assert(text, hasString: "not found")
    }

    func testCanUseOptionalText() throws {
        let optionalText: Text? = Text("optional")
        let text = Text {
           optionalText
        }
        try assert(text, hasString: "optional")
    }

    func testCanUseNil() throws {
        let text = Text {
           nil
        }
        try assert(text, hasString: "")
    }

    func testCanUseDo() throws {
        let text = Text {
            do {
                Text("nested")
            }
        }
        try assert(text, hasString: "nested")
    }

    static var allTests = [
        ("testCanUseIfWithPositiveResult", testCanUseIfWithPositiveResult),
        ("testCanUseIfWithNegativeResult", testCanUseIfWithNegativeResult),
        ("testCanUseIfElseWithPositiveResult", testCanUseIfElseWithPositiveResult),
        ("testCanUseIfElseWithNegativeResult", testCanUseIfElseWithNegativeResult),
        ("testCanUseIfLetWithPositiveResult", testCanUseIfLetWithPositiveResult),
        ("testCanUseIfLetWithNegativeResult", testCanUseIfLetWithNegativeResult),
        ("testCanUseOptionalText", testCanUseOptionalText),
        ("testCanUseNil", testCanUseNil),
        ("testCanUseDo", testCanUseDo),
    ]
}
