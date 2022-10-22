//
//  DetailView.swift
//  Practica
//
//  Created by Nicolas on 17/10/22.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        switch (viewModel.status){
        case.loading:
            LoadingView()
        case.error(error: let msg):
            ErrorView(error: msg)
        case.loaded:
            List {
                if let comics = viewModel.comics, comics.count > 0 {
                    ForEach(comics) { comic in
                        ComicView(comic: comic)
                    }
                }else {
                    VStack{
                        Image("not-found")
                            .resizable()
                            .aspectRatio(contentMode:.fit)
                            .foregroundColor(.blue)
                            .padding()
                            .shadow(color: .black, radius: 16)
                        Text("Sin Resultados")
                            .fontWeight(.bold)
                            .font(.title)
                    }
                }
            }
            .navigationTitle("Comics")
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(characterID: 1009175) )
    }
}
