//
//  CoordinatorTest.swift
//  CinemaMVVMTests
//
//  Created by Nick Bashkatov on 13.05.2021.
//

@testable import CinemaMVVM
import XCTest

final class CoordinatorTest: XCTestCase {
    var coordinator: CoordinatorProtocol?
    var cinemaModel: CinemaModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoordinator() {
        cinemaModel = CinemaModel(posterPath: "Big", originalTitle: "Big", overview: "Big", voteAverage: 10)
        coordinator?.startMain()
        coordinator?.startDetail(model: cinemaModel ?? CinemaModel(
            posterPath: "",
            originalTitle: "",
            overview: "",
            voteAverage: 0
        ))

        XCTAssertTrue(cinemaModel != nil)
        XCTAssertFalse(coordinator?.startMain() != nil)
    }
}
