//
//  LoadingView.swift
//  Practica
//
//  Created by Nicolas on 17/10/22.
//

import SwiftUI

struct LoadingView: View {
    private let bg = ["a-loading","b-loading","c-loading"]
    private let randomInt = Int.random(in: 0..<3)
    private let figSize = 25.0
    private let figColor = Color.white
    @State private var shouldAnimate = false
    
    var body: some View {
        ZStack{
            Image(bg[randomInt])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.top)
                .overlay(Color.black)
                .opacity(0.4)
            VStack{
                Text("Cargando datos")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                HStack {
                    Circle()
                        .fill(figColor)
                        .frame(width: figSize, height: figSize)
                        .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                        .animation(.easeInOut(duration: 0.5).repeatForever(), value: shouldAnimate)
                    Circle()
                        .fill(figColor)
                        .frame(width: figSize, height: figSize)
                        .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                        .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.3), value: shouldAnimate)
                    Circle()
                        .fill(figColor)
                        .frame(width: figSize, height: figSize)
                        .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                        .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.6), value: shouldAnimate)
                }
                .padding()
                .onAppear {
                    self.shouldAnimate = true
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
