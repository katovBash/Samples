//
//  AssemblyBuilderTest.swift
//  CinemaMVVMTests
//
//  Created by Nick Bashkatov on 13.05.2021.
//

@testable import CinemaMVVM
import XCTest

final class AssemblyBuilderTest: XCTestCase {
    var assemblyBuilder: AssemblyBuilderProtocol?
    var coordinator: CoordinatorProtocol!
    var cinemaModel: CinemaModel?
    var navController = UINavigationController()

    func testAssemblyBuilder() {
        cinemaModel = CinemaModel(posterPath: "Big", originalTitle: "big", overview: "big", voteAverage: 1)

        let mainVC = assemblyBuilder?.createDetailModule(
            cinema: cinemaModel ?? CinemaModel(posterPath: "", originalTitle: "", overview: "", voteAverage: 0),
            coordinator: coordinator
        )
        let detailVC = assemblyBuilder?.createMainModule(coordinator: coordinator)

        XCTAssert(cinemaModel != nil)
        XCTAssert(mainVC == detailVC)
    }
}
