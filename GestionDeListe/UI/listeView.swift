//
//  listeView.swift
//  GestionDeListe
//
//  Created by Pascal Rocq on 27/10/2020.
//

import SwiftUI

struct ListView: View {
    @State var nomNouvelArticle:String = ""
    @State var gestionDeListe = ListeManagement()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: dump, label: { Text("dump") })
                TextField("nouvel article", text: $nomNouvelArticle)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                Button(action: creerNouvelArticle, label: {
                    Image(systemName: "cart.fill.badge.plus")
                })
            }.padding()
            NavigationView {
                List(gestionDeListe.groceryList) { art in
                    NavigationLink(destination: ArticleDetailView(article: art)) {
                        ArticleView (article: art) }
                }
            }
            .navigationBarTitle(Text("Liste des articles"))
        }
    }
    
    func creerNouvelArticle() {
        if nomNouvelArticle.count > 0 {
            gestionDeListe.ajoutArticle(withName: nomNouvelArticle, inShelf: "big bazar", ofPriority: 1)
            nomNouvelArticle = ""
        }
    }
    
    func dump () {
        print ("### DÉBUT DUMP ###")
        for art in gestionDeListe.groceryList {
            print ("\(art.articleName) - \(art.articlePriority)")
        }
        print ("### FIN DUMP ###")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            
    }
}
