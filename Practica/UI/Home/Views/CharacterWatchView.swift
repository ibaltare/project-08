//
//  CharacterWatchView.swift
//  Practica
//
//  Created by Nicolas on 23/10/22.
//

import SwiftUI

struct CharacterWatchView: View {
    var character: Character
    private let radius = 16.0
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: character.thumbnail.path + "." + character.thumbnail.thumbnailExtension)) { photoDownload in
                photoDownload
                    .resizable()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .opacity(0.6)
            }
            .frame(width: 150, height: 150, alignment: .init(horizontal: .center, vertical: .center))
            .aspectRatio(contentMode:.fit)
            .cornerRadius(radius)
            .padding()
            .shadow(color: .black, radius: radius)
            .overlay(
                ZStack {
                    Rectangle()
                        .frame(height: 40)
                        .foregroundColor(.black)
                        .padding(.top, radius)
                        .cornerRadius(radius)
                        .padding(.top, -radius)
                        .opacity(0.7)
                    Text("\(character.name)")
                        .font(.body)
                        .foregroundColor(Color.yellow)
                }
                .padding()
                ,alignment: .bottom
            )
            
        }
    }
}

struct CharacterWatchView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterWatchView(character: Character(id: 1, name: "character name", description: "character escriptor", modified: "2014-04-29T14:18:17-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: "jpg"), resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"))
    }
}
