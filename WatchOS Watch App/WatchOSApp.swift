//
//  WatchOSApp.swift
//  WatchOS Watch App
//
//  Created by Nicolas on 23/10/22.
//

import SwiftUI

@main
struct WatchOS_Watch_AppApp: App {
    @StateObject var mainViewModel = MainViewModel()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(mainViewModel)
        }
    }
}
