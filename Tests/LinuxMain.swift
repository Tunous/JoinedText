import XCTest

import JoinedTextTests

var tests = [XCTestCaseEntry]()
tests += CodeFlowTests.allTests()
tests += TextJoiningTests.allTests()
XCTMain(tests)
