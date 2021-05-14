//
//  CoreData.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 12.05.2021.
//

import CoreData
import Foundation
import UIKit

protocol CoreDataProviderProtocol {
    func deleteObjectsFromCoreData(context: NSManagedObjectContext)
    func saveDateToCoreDate(movies: [CinemaModel], context: NSManagedObjectContext)
    func getInfoCoreData(model: CinemaListModel)
}

final class CoreDataProvider: CoreDataProviderProtocol {
    static let shareInstance = CoreDataProvider()
    private let container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    private let fetchRequest = NSFetchRequest<MovieCoreData>(entityName: "MovieCoreData")

    func saveData(movie: [CinemaModel]) {
        container?.performBackgroundTask { context in
            self.deleteObjectsFromCoreData(context: context)
            self.saveDateToCoreDate(movies: movie, context: context)
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

    func saveDateToCoreDate(movies: [CinemaModel], context: NSManagedObjectContext) {
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
                fatalError("\(error)")
            }
        }
    }

    func getInfoCoreData(model: CinemaListModel) {
        DispatchQueue.main.async {
            if let context = self.container?.viewContext {
                let request: NSFetchRequest<MovieCoreData> = MovieCoreData.fetchRequest()
                request.sortDescriptors = [NSSortDescriptor(key: #keyPath(MovieCoreData.rate), ascending: false)]
                let data = try? context.fetch(request)
                let result = data?.compactMap { movie -> CinemaModel in
                    let movieEntity = CinemaModel(
                        posterPath: movie.posterImage ?? String(),
                        originalTitle: movie.title ?? String(),
                        overview: movie.overView ?? String(),
                        voteAverage: movie.rate
                    )
                    return movieEntity
                }
                model.results = result ?? []
            }
        }
    }
}
