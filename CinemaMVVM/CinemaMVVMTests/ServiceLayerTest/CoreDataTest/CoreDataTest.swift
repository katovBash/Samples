//
//  CoreDataTest.swift
//  CinemaMVVMTests
//
//  Created by Nick Bashkatov on 13.05.2021.
//

@testable import CinemaMVVM
import CoreData
import XCTest

final class CoreDataTest: XCTestCase {
    var coreData: CoreDataProviderProtocol?
    var cinemaListModel: CinemaListModel?
    var cinemaModel: [CinemaModel]?

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testCoreData() {
        cinemaModel = [CinemaModel(posterPath: "big", originalTitle: "big", overview: "big", voteAverage: 1)]

        let container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer

        let context = container?.viewContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

        coreData?.deleteObjectsFromCoreData(context: context)
        coreData?.getInfoCoreData(model: cinemaListModel ?? CinemaListModel())
        coreData?.saveDateToCoreDate(
            movies: cinemaModel ?? [CinemaModel(posterPath: "", originalTitle: "", overview: "", voteAverage: 0)],
            context: context
        )

        XCTAssert(container != nil)
        XCTAssert(cinemaModel?.count == 1)
        XCTAssert(coreData?.deleteObjectsFromCoreData(context: context) == nil)
        XCTAssert(coreData?.getInfoCoreData(model: cinemaListModel ?? CinemaListModel()) == nil)
        XCTAssert(coreData?.saveDateToCoreDate(
            movies: cinemaModel ?? [CinemaModel(posterPath: "", originalTitle: "", overview: "", voteAverage: 0)],
            context: context
        ) == nil)
    }
}
