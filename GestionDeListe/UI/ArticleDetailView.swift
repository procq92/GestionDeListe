//
//  ArticleDetailView.swift
//  GestionDeListe
//
//  Created by Pascal Rocq on 26/10/2020.
//

import SwiftUI


struct ArticleDetailView: View {
    @State var article:Article

    var body: some View {
        VStack {
            HStack {
                Text("\(article.articleName)")
                Spacer()
                Text ("\(article.articlePriority)")
            }
        }
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let articleExemple1 = Article (nameOfArticle: "tomate", shelf: "Légumes", priority: 0)
        let articleExemple2 = Article (nameOfArticle: "poivrons", shelf: "Légumes", priority: 1)
        let articleExemple3 = Article (nameOfArticle: "huile", shelf: "Épicerie", priority: 2)
        let articleExemple4 = Article (nameOfArticle: "eau", shelf: "Boissons", priority: 3)
        Group {
            ArticleDetailView(article: articleExemple1)
                .previewLayout(.sizeThatFits)
            ArticleDetailView (article: articleExemple2)
                .previewLayout(.sizeThatFits)
            ArticleDetailView (article: articleExemple3)
                .previewLayout(.sizeThatFits)
            ArticleDetailView (article: articleExemple4)
                .previewLayout(.sizeThatFits)
        }
    }
}
