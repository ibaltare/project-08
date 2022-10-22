//
//  MainViewModel.swift
//  Practica
//
//  Created by Nicolas on 17/10/22.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    @Published var status = Status.Init
    
    static func cancel(suscriptor:  inout Set<AnyCancellable>){
        suscriptor.forEach { AnyCancellable in
            AnyCancellable.cancel()
        }
    }
}
