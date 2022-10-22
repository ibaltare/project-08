//
//  PracticaApp.swift
//  Practica
//
//  Created by Nicolas on 13/10/22.
//

import SwiftUI

@main
struct PracticaApp: App {
    @StateObject var mainViewModel = MainViewModel()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(mainViewModel)
        }
    }
}
