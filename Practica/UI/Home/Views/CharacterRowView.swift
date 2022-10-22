//
//  CharacterRowView.swift
//  Practica
//
//  Created by Nicolas on 19/10/22.
//

import SwiftUI

struct CharacterRowView: View {
    var character: Character
    private let radius = 16.0
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: character.thumbnail.path + "." + character.thumbnail.thumbnailExtension)) { photoDownload in
                photoDownload
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .cornerRadius(radius)
                    .padding()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .cornerRadius(radius)
                    .opacity(0.6)
            }
            .shadow(color: .black, radius: radius)
            .overlay(
                ZStack {
                    Rectangle()
                        .frame(height: 60)
                        .foregroundColor(.black)
                        .padding(.top, radius)
                        .cornerRadius(radius)
                        .padding(.top, -radius)
                        .opacity(0.7)
                    Text("\(character.name)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                }
                .padding()
                ,alignment: .bottom
            )
            
            
        }
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView(character: Character(id: 1, name: "character name", description: "character escriptor", modified: "2014-04-29T14:18:17-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: "jpg"), resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"))
    }
}
