//
//  HomeView.swift
//  Practica
//
//  Created by Nicolas on 17/10/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    
    var body: some View {
        
        switch (viewModel.status){
        case.loading:
            LoadingView()
        case.error(error: let msg):
            ErrorView(error: msg)
        case.loaded:
            NavigationStack{
                List {
                    if let characters = viewModel.characters {
                        ForEach(characters) { character in
                            NavigationLink {
                                DetailView(viewModel: DetailViewModel(characterID: character.id))
                            } label: {
                                #if os(watchOS)
                                    CharacterWatchView(character: character)
                                #else
                                    CharacterRowView(character: character)
                                #endif
                            }
                        }
                    }
                }
                .background{
                    Image("bg-image")
                        .opacity(0.2)
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Marvel Universe")
                
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
