//
//  ComicView.swift
//  Practica
//
//  Created by Nicolas on 21/10/22.
//

import SwiftUI

struct ComicView: View {
    var comic: Comic
    private let radius = 25.0
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: comic.thumbnail.path + "." + comic.thumbnail.thumbnailExtension)) { photoDownload in
                photoDownload
                    .resizable()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .opacity(0.6)
            }
            #if os(watchOS)
            .frame(width: 120, height: 150, alignment: .center)
            #endif
            .aspectRatio(contentMode:.fit)
            .cornerRadius(radius)
            .padding()
            .shadow(color: .black , radius: 12)
            #if os(watchOS)
            Text("\(comic.title)")
                .font(.body)
                .padding()
            #else
            Text("\(comic.title)")
                .font(.title)
                .padding()
            Text("\(comic.description ?? "Sin descripción")")
                .padding()
            #endif
            
        }
        .padding()
        .border(.gray, width: 4)
        
    }
}

struct ComicView_Previews: PreviewProvider {
    static var previews: some View {
        ComicView(comic: Comic(id: 1, title: "Uncanny X-Men (1981) #114", variantDescription: "", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.", resourceURI: "http://gateway.marvel.com/v1/public/comics/12430", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/40/5372af08d57b1", thumbnailExtension: "jpg"), images: [Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/40/5372af08d57b1", thumbnailExtension: "jpg"), Thumbnail(path:"http://i.annihil.us/u/prod/marvel/i/mg/3/00/4bc37618a7320", thumbnailExtension: "jpg")]))
    }
}
