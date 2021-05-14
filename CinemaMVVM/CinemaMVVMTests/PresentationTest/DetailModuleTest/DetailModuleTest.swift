//
//  DetailModuleTest.swift
//  CinemaMVVMTests
//
//  Created by Nick Bashkatov on 13.05.2021.
//

@testable import CinemaMVVM
import XCTest

final class DetailModuleTest: XCTestCase {
    private var detailProtocol: DetailViewModelProtocol?

    func testDetailModel() {
        detailProtocol?.getCinema(movieID: 22)
        XCTAssert(detailProtocol?.getCinema(movieID: 2) == nil)
    }
}
