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
    
    func addNewArticle (article:Article) {
        let newCDArticle = CDArticle (context: context)
        newCDArticle.id = article.id
        newCDArticle.articleName = article.articleName
        newCDArticle.articleShelf = article.articleShelf
        newCDArticle.articlePriority = Int16(article.articlePriority)
        newCDArticle.freqOfAppro = Int16(article.freqOfAppro)
        saveDataInCoreData()
   }
    
    func fetchShelfList () -> [Shelf] {
        let shelfList:[Shelf]
        let fetchRequest:NSFetchRequest<CDShelf> = CDShelf.fetchRequest()
        if let rawShelfList = try? context.fetch(fetchRequest) {
            shelfList = rawShelfList.compactMap({ (rawShelf) -> Shelf? in
                Shelf (fromCoreDataShelf: rawShelf)
            })
        }
        else {
            shelfList = []
        }
        return shelfList
    }
    
    private func saveDataInCoreData () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print ("Erreur pendant la sauvegarde CoreData : \(error.localizedDescription) ")
            }
        }
    }
}


extension Article {
    init?(fromCoreDataArticle coreDataObject:CDArticle) {
        guard let id = coreDataObject.id,
              let articleName = coreDataObject.articleName,
              let articleShelf = coreDataObject.articleShelf else {
            return nil
        }
        self.id = id
        self.articleName = articleName
        self.articleShelf = articleShelf
        self.articlePriority = Int (coreDataObject.articlePriority)
        self.freqOfAppro = Int(coreDataObject.freqOfAppro)
        
    }
}

extension Shelf {
    init?(fromCoreDataShelf coreDataObject:CDShelf) {
        guard let id = coreDataObject.id,
              let shelfName = coreDataObject.shelfName,
              let shelfDescription = coreDataObject.shelfDescription else {
            return nil
        }
        self.id = id
        self.shelfName = shelfName
        self.ShelfDescription = shelfDescription
    }
}
