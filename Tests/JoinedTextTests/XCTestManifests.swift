import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CodeFlowTests.allTests),
        testCase(TextJoiningTests.allTests),
    ]
}
#endif
