//
//  File.swift
//  
//
//  Created by Łukasz Rutkowski on 29/08/2020.
//

import XCTest
import SwiftUI

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
        #if swift(<5.3)
        throw XCTSkip("Available since swift 5.3")
        #else
        let optional: String? = "found"
        let text = Text {
           if let found = optional {
               Text(found)
           } else {
               Text("not found")
           }
        }
        try assert(text, hasString: "found")
        #endif
    }

    func testCanUseIfLetWithNegativeResult() throws {
        #if swift(<5.3)
        throw XCTSkip("Available since swift 5.3")
        #else
        let optional: String? = nil
        let text = Text {
           if let found = optional {
               Text(found)
           } else {
               Text("not found")
           }
        }
        try assert(text, hasString: "not found")
        #endif
    }

    func testCanUseOptionalText() throws {
        #if swift(<5.3)
        throw XCTSkip("Available since swift 5.3")
        #else
        let optionalText: Text? = Text("optional")
        let text = Text {
           optionalText
        }
        try assert(text, hasString: "optional")
        #endif
    }

    func testCanUseNil() throws {
        #if swift(<5.3)
        throw XCTSkip("Available since swift 5.3")
        #else
        let text = Text {
           nil
        }
        try assert(text, hasString: "")
        #endif
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
