//
//  AssemblyBuilderTest.swift
//  CinemaMVVMTests
//
//  Created by Nick Bashkatov on 13.05.2021.
//

@testable import CinemaMVVM
import XCTest

final class AssemblyBuilderTest: XCTestCase {
    private var assemblyBuilder: BuilderProtocol?
    private var coordinator: CoordinatorProtocol!
    private var cinemaModel: CinemaListEntity?
    private var navController = UINavigationController()

    func testAssemblyBuilder() {
        cinemaModel = CinemaListEntity(posterPath: "Big", originalTitle: "big", overview: "big", voteAverage: 1)

        let mainVC = assemblyBuilder?.createDetailModule(
            cinema: cinemaModel ?? CinemaListEntity(posterPath: "", originalTitle: "", overview: "", voteAverage: 0),
            coordinator: coordinator
        )
        let detailVC = assemblyBuilder?.createMainModule(coordinator: coordinator)

        XCTAssert(cinemaModel != nil)
        XCTAssert(mainVC == detailVC)
        XCTAssert(assemblyBuilder?.createMainModule(coordinator: coordinator) == nil)
        XCTAssert(assemblyBuilder?.createDetailModule(
            cinema: cinemaModel ?? CinemaListEntity(posterPath: "", originalTitle: "", overview: "", voteAverage: 0),
            coordinator: coordinator
        ) == nil)
    }
}
