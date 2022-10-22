//
//  ErrorView.swift
//  Practica
//
//  Created by Nicolas on 17/10/22.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    private var error:String
    
    init(error: String) {
        self.error = error
    }
    
    var body: some View {
        VStack{
            Text("Error")
                .foregroundColor(Color.red)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("\(error)")
                .padding()
            
            Image("error")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .shadow(radius: 20)
            
            Button {
                mainViewModel.status = .Init
            } label: {
                Text("Inicio")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color(red: 83/255, green: 73/255, blue: 104/255))
                    .cornerRadius(15)
            }
        }
        
        
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Message from debugger: Terminated due to signal 9")
    }
}
