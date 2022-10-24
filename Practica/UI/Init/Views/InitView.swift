//
//  InitView.swift
//  Practica
//
//  Created by Nicolas on 13/10/22.
//

import SwiftUI

struct InitView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State private var animationAmounth = 1.0
    @State var scale = 0.0
    @State var fade: Bool = false
    
    var body: some View {
        VStack{
            #if os(watchOS)
            Image("marvel")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            #else
            Image("fondo1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .scaleEffect(scale)
                .onAppear(){
                    let baseAnimation = Animation.easeInOut(duration: 2)
                    withAnimation(baseAnimation) {
                        scale = 1.0
                    }
                }
            #endif
            Button {
                mainViewModel.status = .Home
            } label: {
                Text("Entrar")
                    #if os(watchOS)
                    .font(.body)
                    .fontWeight(.bold)
                    .frame(width: 100, height: 30)
                    #else
                    .font(.title)
                    .frame(width: 200, height: 50)
                    #endif
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
            }
            .padding(.top, 50)
            .overlay(
                Circle()
                    .stroke(Color.white)
                    .scaleEffect(animationAmounth)
                    .opacity(2-animationAmounth)
                    .animation(.easeInOut(duration: 1.5).repeatForever(), value: animationAmounth)
                    .padding(.top,50)
            )
            .opacity(fade ? 0.8 : 0)
            .onAppear{
                animationAmounth = 2
                withAnimation(.easeInOut(duration: 5).delay(2)){ fade.toggle() }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

struct InitView_Previews: PreviewProvider {
    static var previews: some View {
        InitView()
    }
}
