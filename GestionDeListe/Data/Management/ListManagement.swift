//
//  ListManagement.swift
//  GestionDeListe
//
//  Created by Pascal Rocq on 26/10/2020.
//

import Foundation

struct ListeManagement {
    var groceryList:[Article]
    var shelfList:[Shelf]
    let storage:CoreDataStorage = CoreDataStorage ()
    
    init () {
        groceryList = storage.fetchGroceryList()
        shelfList = storage.fetchShelfList()
    }
    
    @discardableResult
    mutating func addArticle(withName articleName:String, inShelf shelfName:String, ofPriority priority:Int) -> Article {
        let newArticle = Article(nameOfArticle: articleName, shelf: shelfName, priority: priority)
        groceryList.append(newArticle)
        return newArticle
    }
}
