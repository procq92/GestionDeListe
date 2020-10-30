//
//  Article.swift
//  GestionDeListe
//
//  Created by Pascal Rocq on 26/10/2020.
//

import Foundation

enum ListStatus {
    case nouveau, terminé, annulé, encours, reporté
}
enum Unité {
    case pièce, par4, par8, par12, par16, g, g10, g100, kg, l
}
//struct Rayon :Identifiable {
//    var id = UUID()
//    var nomRayon:String
//}
//struct Article : Identifiable {

struct Article :Identifiable {
    var id = UUID()
    var articleName:String
    var articleShelf:String = ""
    var articlePriority:Int = 0
    var freqOfAppro:Int = 1
//    var inShelf:Shelf?

/*    init(nameOfArticle: String, shelf: String) {
        self.articleName = nameOfArticle
        self.articleShelf = shelf
    }
    
    convenience init(nameOfArticle: String, shelf: String, priority: Int) {
        self.init(nameOfArticle: nameOfArticle, shelf: shelf)
        self.articlePriority = priority
    }
*/
    mutating func changeArticlePriority () {
        print ("self = \(self.articleName) - \(self.articlePriority)")
        if self.articlePriority == 3 {
            self.articlePriority = 0
        }
        else {
            self.articlePriority += 1
        }
    }
    
    mutating func changeArticleShelf (inShelf shelf:String) {
        self.articleShelf = shelf
    }
    
}
