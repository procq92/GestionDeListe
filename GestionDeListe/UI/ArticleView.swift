//
//  ArticleView.swift
//  GestionDeListe
//
//  Created by Pascal Rocq on 27/10/2020.
//

import SwiftUI

struct ArticleView: View {
    @State var article:Article
    @State var newLevel:Int = 0

    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Button(action: changeLevel, label: {
                    Image(systemName: "plus")
                })
                HStack(spacing: -4.0) {
                    Image(systemName: newLevel == 0 ? "rhombus" : "rhombus.fill")
                    Image(systemName: newLevel <= 1 ? "rhombus" : "rhombus.fill")
                    Image(systemName: newLevel <= 2 ? "rhombus" : "rhombus.fill")
                }
                .onTapGesture {
                    changeLevel()
                }
                Text(article.articleName)
                Spacer()
                Image(systemName: "cart.fill.badge.plus")
            }
            Text(article.articleShelf)
                .font(.footnote)
                .fontWeight(.thin)
                .foregroundColor(Color.purple)
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal)
    }

    func changeLevel () {
        print ("Av newLevel=\(newLevel)")
        if newLevel == 3 { newLevel = 0 } else { newLevel += 1 }
        article.articlePriority = newLevel
        print ("Ap newLevel=\(newLevel)")
    }
}

struct elementDeListe_Previews: PreviewProvider {
    static var previews: some View {
        let articleExemple1 = Article (nameOfArticle: "tomate", shelf: "Légumes", priority: 0)
        let articleExemple2 = Article (nameOfArticle: "poivrons", shelf: "Légumes", priority: 1)
        let articleExemple3 = Article (nameOfArticle: "huile", shelf: "Épicerie", priority: 2)
        let articleExemple4 = Article (nameOfArticle: "eau", shelf: "Boissons", priority: 3)
        Group {
            ArticleView (article: articleExemple1)
                .previewLayout(.sizeThatFits)
            ArticleView (article: articleExemple2)
                .previewLayout(.sizeThatFits)
            ArticleView (article: articleExemple3)
                .previewLayout(.sizeThatFits)
            ArticleView (article: articleExemple4)
                .previewLayout(.sizeThatFits)
        }
    }
}
