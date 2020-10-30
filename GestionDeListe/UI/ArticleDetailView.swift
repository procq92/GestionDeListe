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
            .padding()
            HStack {
                Text("Rayon : \(article.articleShelf)")
                Spacer()
                
            }
            .padding()
        }
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let articleExemple1 = Article (articleName: "tomates")
        let articleExemple2 = Article (articleName: "poivrons")
        let articleExemple3 = Article (articleName: "huile")
        let articleExemple4 = Article (articleName: "eau")
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
