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
    
    init () {
        groceryList = []
        shelfList = []
    }
    
    @discardableResult
    mutating func ajoutArticle(withName articleName:String, inShelf shelfName:String, ofPriority priority:Int) -> Article {
        let nouvelArticle = Article(nameOfArticle: articleName, shelf: shelfName, priority: priority)
        groceryList.append(nouvelArticle)
        return nouvelArticle
    }
}
