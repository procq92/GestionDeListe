//
//  CoreDataStorage.swift
//  GestionDeListe
//
//  Created by Pascal Rocq on 29/10/2020.
//

import Foundation
import CoreData

class CoreDataStorage {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GestionDeListe")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func fetchGroceryList () -> [Article] {
        let groceryList:[Article]
        let fetchRequest:NSFetchRequest<CDArticle> = CDArticle.fetchRequest()
        if let rawGroceryList = try? context.fetch(fetchRequest) {
            groceryList = rawGroceryList.compactMap({ (rawArticle) -> Article? in
                Article (fromCoreDataArticle: rawArticle)
            })
        }
        else {
            groceryList = []
        }
        return groceryList
    }
    
    func fetchShelfList () -> [Shelf] {
        return []
    }
}

extension Article {
    convenience init?(fromCoreDataArticle coreDataObject:CDArticle) {
        guard let id = coreDataObject.id,
              let articleName = coreDataObject.articleName,
              let articleShelf = coreDataObject.articleShelf else {
            return nil
        }
        self.init(nameOfArticle: articleName, shelf: articleShelf)
        self.id = id
        self.articleName = articleName
        self.articlePriority = Int (coreDataObject.articlePriority)
        self.freqOfAppro = Int(coreDataObject.freqOfAppro)
        
    }
}
