//
//  Constants.swift
//  Practica
//
//  Created by Nicolas on 17/10/22.
//

import Foundation

enum Status {
    case Init, Home
}

enum ViewStatus: Equatable {
    case loading, loaded, error(error: String)
}

enum MarvelApi {
    static let PublicKey = "ab19437d9e0c64db15e1cfde58bda5ff"
    static let PrivateKey = "2e0e92a65292dbbc2fb8262598c5ed12ece043ee"
    static let URLCharacters = "https://gateway.marvel.com:443/v1/public/characters"
}

enum HTTPMethod: String {
    case Get = "GET"
    case Post = "POST"
    case Delete = "DELETE"
    case Content = "application/json"
}

