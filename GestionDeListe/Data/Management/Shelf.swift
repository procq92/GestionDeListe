//
//  Shelf.swift
//  GestionDeListe
//
//  Created by Pascal Rocq on 26/10/2020.
//

import Foundation

struct Shelf : Identifiable {
    var id:UUID = UUID()
    var shelfName = ""
    var ShelfDescription = ""
}

/*var listOfShelvesSet: Set<String> = ["Légumes", "Fruits", "Produits laitiers", "Fromages", "Charcuterie", "Boucherie", "Desserts", "Apéritifs"]
var listOfShelvesDict = ["Tomates" : "Légumes", "Courgettes" : "Poireau", "Pommes de terre" : "Légumes", "Pommes" : "Fruits"]*/
