//
//  AppDelegateTest.swift
//  CinemaMVVMTests
//
//  Created by Nick Bashkatov on 13.05.2021.
//

@testable import CinemaMVVM
import CoreData
import XCTest

final class AppDelegateTest: XCTestCase {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CinemaMVVM")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func testSaveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
