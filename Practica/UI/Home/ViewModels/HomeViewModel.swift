//
//  HomeViewModel.swift
//  Practica
//
//  Created by Nicolas on 17/10/22.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var status = ViewStatus.loading
    @Published var characters:[Character]?
    //@EnvironmentObject var mainViewModel: MainViewModel
    private var suscriptor = Set<AnyCancellable>()
    
    init(){
        loadCheracters()
    }
    
    func loadCheracters(){
        MainViewModel.cancel(suscriptor: &suscriptor)
        NetworkService.shared.getData(type: CharacterDataWrapper.self, urlRequest: NetworkService.shared.getSessionCharacters())
            //.receive(on: DispatchQueue.main)
            .delay(for: 2, scheduler: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    self.status = .error(error: error.localizedDescription)
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { data in
                self.characters = data.data.results
            }
            .store(in: &suscriptor)

    }
}
