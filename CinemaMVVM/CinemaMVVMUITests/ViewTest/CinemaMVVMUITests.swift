//
//  CinemaMVVMUITests.swift
//  CinemaMVVMUITests
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import XCTest

class CinemaMVVMUITests: XCTestCase {

    func testUI() {
       let app = XCUIApplication()
       app.launch()
       
        app.tables.staticTexts["Mortal Kombat"].tap()
        app.navigationBars["Mortal Kombat"].buttons["Back"].tap()

       app.tables.staticTexts["Godzilla vs. Kong"].tap()
       app.navigationBars["Godzilla vs. Kong"].buttons["Back"].tap()

       app.tables.staticTexts["Nobody"].tap()
       app.navigationBars["Nobody"].buttons["Back"].tap()

       app.tables.staticTexts["Vanquish"].tap()
       app.navigationBars["Vanquish"].buttons["Back"].tap()

       app.tables.staticTexts["The Unholy"].tap()
       app.navigationBars["The Unholy"].buttons["Back"].tap()

       app.tables.staticTexts["Thunder Force"].tap()
       app.navigationBars["Thunder Force"].buttons["Back"].tap()

       app.tables.staticTexts["Sentinelle"].tap()
       app.navigationBars["Sentinelle"].buttons["Back"].tap()
       app.accessibilityPerformMagicTap()
   }
}
