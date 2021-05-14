//
//  CinemaMVVMUITests.swift
//  CinemaMVVMUITests
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import XCTest

final class CinemaMVVMUITests: XCTestCase {
    func testUI() {
        let app = XCUIApplication()
        app.launch()

        app.tables.staticTexts["Mortal Kombat"].tap()
        app.swipeLeft()
        app.swipeRight()
        app.buttons["Back"].tap()

        app.tables.staticTexts["Godzilla vs. Kong"].tap()
        app.buttons["Back"].tap()

        app.tables.staticTexts["Nobody"].tap()
        app.buttons["Back"].tap()

        app.tables.staticTexts["Vanquish"].tap()
        app.buttons["Back"].tap()

        app.tables.staticTexts["The Unholy"].tap()
        app.buttons["Back"].tap()

        app.tables.staticTexts["Sentinelle"].tap()
        app.buttons["Back"].tap()
        app.accessibilityPerformMagicTap()
    }
}
