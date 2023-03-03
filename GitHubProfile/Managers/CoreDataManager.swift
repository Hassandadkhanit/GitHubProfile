//
//  CoreDataManager.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 05/10/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init(){}
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "GitHubProfile")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
//    func fetch<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate? = nil, limit: Int? = nil) -> Result<[T], Error> {
//            let request = objectType.fetchRequest()
//            request.predicate = predicate
//            if let limit = limit {
//                request.fetchLimit = limit
//            }
//            do {
//                let result = try context.fetch(request)
//                return .success(result as? [T] ?? [])
//            } catch {
//                return .failure(error)
//            }
//        }
}
