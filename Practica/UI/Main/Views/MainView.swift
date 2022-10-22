//
//  MainView.swift
//  Practica
//
//  Created by Nicolas on 17/10/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        switch (mainViewModel.status){
        case .Init:
            InitView()
        case .Home:
            HomeView(viewModel: HomeViewModel())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(MainViewModel())
    }
}
