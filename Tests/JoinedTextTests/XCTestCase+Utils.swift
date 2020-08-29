//
//  File.swift
//  
//
//  Created by Łukasz Rutkowski on 29/08/2020.
//

import XCTest
import SwiftUI
import ViewInspector

extension XCTestCase {

    func assert(_ text: Text, hasString expectedString: String) throws {
        let inspectedText = try text.inspect().text()
        let string = try inspectedText.string()
        XCTAssertEqual(string, expectedString)
    }
}
