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
    private var coreData: CoreDataServiceProtocol?
    private var cinemaListModel: CinemaEntity?
    private var cinemaModel: [CinemaListEntity]?

    override func setUp() {
        coreData = CoreDataService.shareInstance
    }

    func testCoreData() {
        cinemaModel = [CinemaListEntity(posterPath: "big", originalTitle: "big", overview: "big", voteAverage: 1)]

        let container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer

        let context = container?.viewContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

        coreData?.deleteObjectsFromCoreData(context: context)
        coreData?.getInfoCoreData(model: cinemaListModel ?? CinemaEntity())
        coreData?.saveDataToCoreData(
            movies: cinemaModel ?? [CinemaListEntity(posterPath: "", originalTitle: "", overview: "", voteAverage: 0)],
            context: context
        )

        XCTAssert(container != nil)
        XCTAssert(cinemaModel?.count == 1)
        XCTAssert(coreData?.deleteObjectsFromCoreData(context: context) != nil)
        XCTAssert(coreData?.getInfoCoreData(model: cinemaListModel ?? CinemaEntity()) != nil)
        XCTAssert(coreData?.saveDataToCoreData(
            movies: cinemaModel ?? [CinemaListEntity(posterPath: "", originalTitle: "", overview: "", voteAverage: 0)],
            context: context
        ) != nil)
    }
}
