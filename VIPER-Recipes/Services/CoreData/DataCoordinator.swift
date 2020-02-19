//
//  DataCoordinator.swift
//  VIPER-Recipes
//
//  Created by admin on 19.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import CoreData

final class DataCoordinator {
    private static var coordinator: DataCoordinator?
    
    /// Singleton to manage the core data stack
    public class func sharedInstance() -> DataCoordinator {
        if coordinator == nil {
            coordinator = DataCoordinator()
        }
        return coordinator!
    }
    
    public var container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "Recipes")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unresolved error \(error.localizedDescription)")
            }
        }
    }
    
    /*
     To write all we have to do is
        DataCoordinator.performBackgroundTask { (context) in
        }
     */
    
    /// write
    static func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> (Void)) {
        DataCoordinator.sharedInstance().container.performBackgroundTask(block)
    }
    
    /*
     To read all we have to do is
     Make sure to use DispatchQueue.main.async or DispatchQueue.main.syncbefore using this method when working from threads.
     DispatchQueue.main.async {
         DataCoordinator.performViewTask { (context) in
         }
     }
     */
    
    /// read
    static func performViewtask(_ block: @escaping (NSManagedObjectContext) -> (Void)) {
        block(DataCoordinator.sharedInstance().container.viewContext)
    }
    
    static func getAllRecipes(comletionHandler: @escaping (Result<[Recipe], Error>) -> ()) -> [Recipe] {
        var result: [Recipe] = []
        DispatchQueue.main.async {
            DataCoordinator.performViewtask { (context) in
                let recipeFR: NSFetchRequest<Recipe> = Recipe.fetchRequest()
                do {
                    recipeFR.returnsObjectsAsFaults = false
                    result = try context.fetch(recipeFR)
                    comletionHandler(.success(result))
                } catch {
                    comletionHandler(.failure(error))
                }
            }
        }
        return result
    }
}
