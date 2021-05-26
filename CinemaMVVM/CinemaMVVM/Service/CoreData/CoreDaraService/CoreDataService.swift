//
//  CoreData.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 12.05.2021.
//

import CoreData
import Foundation
import UIKit

protocol CoreDataServiceProtocol {
    func deleteObjectsFromCoreData(context: NSManagedObjectContext)
    func saveDataToCoreData(movies: [CinemaListEntity], context: NSManagedObjectContext)
}

final class CoreDataService: CoreDataServiceProtocol {
    private let container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer

    private let fetchRequest = NSFetchRequest<MovieCoreData>(entityName: "MovieCoreData")

    func saveData(movie: [CinemaListEntity]) {
        container?.performBackgroundTask { context in
            self.deleteObjectsFromCoreData(context: context)
            self.saveDataToCoreData(movies: movie, context: context)
        }
    }

    func deleteObjectsFromCoreData(context: NSManagedObjectContext) {
        do {
            let objects = try context.fetch(fetchRequest)
            _ = objects.map { context.delete($0) }
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    func saveDataToCoreData(movies: [CinemaListEntity], context: NSManagedObjectContext) {
        context.perform {
            for movie in movies {
                let movieEntity = MovieCoreData(context: context)
                movieEntity.title = movie.title
                movieEntity.overView = movie.overview
                movieEntity.posterImage = movie.posterPath
                guard let rate = movie.voteAverage else { return }
                movieEntity.rate = rate
            }
            do {
                try context.save()
            } catch {
                print("\(error)")
            }
        }
    }
}
