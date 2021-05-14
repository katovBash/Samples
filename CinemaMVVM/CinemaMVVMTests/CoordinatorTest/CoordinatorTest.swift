//
//  CoordinatorTest.swift
//  CinemaMVVMTests
//
//  Created by Nick Bashkatov on 13.05.2021.
//

@testable import CinemaMVVM
import XCTest

final class CoordinatorTest: XCTestCase {
    private var coordinator: CoordinatorProtocol?
    private var cinemaModel: CinemaModel?

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
