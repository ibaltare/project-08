//
//  DetailViewModel.swift
//  Practica
//
//  Created by Nicolas on 20/10/22.
//

import Foundation
import Combine

@MainActor
final class DetailViewModel: ObservableObject {
    @Published var status = ViewStatus.loading
    @Published var comics:[Comic]?
    private var characterID: Int
    
    init(characterID: Int){
        self.characterID = characterID
        loadComics()
    }
    
    func loadComics(){
        Task(priority: .medium) {
            do{
                let result = try await NetworkService.shared.getData(type: ComicDataWrapper.self, urlRequest: NetworkService.shared.getSessionComics(for: characterID))
                try await Task.sleep(nanoseconds: 2_000_000_000)
                self.comics = result.data.results
                self.status = .loaded
            } catch {
                self.status = .error(error: error.localizedDescription)
            }
        }
    }
    
}
