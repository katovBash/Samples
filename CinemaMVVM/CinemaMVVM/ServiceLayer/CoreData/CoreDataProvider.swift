//
//  CoreData.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 12.05.2021.
//

import Foundation
import CoreData
import UIKit

final class CoreDataProvider {
    
    static let shareInstance = CoreDataProvider()
    
    private let container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    private let fetchRequest = NSFetchRequest<MovieCoreData>(entityName: "MovieCoreData")
    
    func saveData(movie: [CinemaModel]) {
        self.container?.performBackgroundTask { [weak self] context in
        }
    }
    
    private func deleteObjectsFromCoreData(context: NSManagedObjectContext) {
        do {
            let objects = try context.fetch(fetchRequest)
            _ = objects.map({ context.delete($0)})
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func saveDateToCoreDate(movies: [CinemaModel], context: NSManagedObjectContext) {
        context.perform {
            for movie in movies {
                let movieEntity = MovieCoreData(context: context)
                movieEntity.title = movie.title
                movieEntity.overView = movie.overview
                movieEntity.posterImage = movie.posterPath
                guard let rate = movie.voteAverage else {return}
                movieEntity.rate = rate
            }
            do {
                try context.save()
            } catch {
                fatalError("\(error)")
            }
        }
    }
}

