//
//  CinemaMVVMUITests.swift
//  CinemaMVVMUITests
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import XCTest

class CinemaMVVMUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUI() {
       let app = XCUIApplication()
       app.launch()
       
       app.tables.cells.staticTexts["Mortal Kombat"].tap()
       app.navigationBars["Mortal Kombat"].buttons["CinemaMVVM"].tap()

       app.tables.staticTexts["Godzilla vs. Kong"].tap()
       app.navigationBars["Godzilla vs. Kong"].buttons["CinemaMVVM"].tap()

       app.tables.staticTexts["Nobody"].tap()
       app.navigationBars["Nobody"].buttons["CinemaMVVM"].tap()

       app.tables.staticTexts["Vanquish"].tap()
       app.navigationBars["Vanquish"].buttons["CinemaMVVM"].tap()

       app.tables.staticTexts["The Unholy"].tap()
       app.navigationBars["The Unholy"].buttons["CinemaMVVM"].tap()

       app.tables.staticTexts["Thunder Force"].tap()
       app.navigationBars["Thunder Force"].buttons["CinemaMVVM"].tap()

       app.tables.staticTexts["Sentinelle"].tap()
       app.navigationBars["Sentinelle"].buttons["CinemaMVVM"].tap()
       app.accessibilityPerformMagicTap()
   }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
