//
//  CharacterModel.swift
//  Practica
//
//  Created by Nicolas on 17/10/22.
//

import Foundation

// MARK: - CharacterDataWrapper
struct CharacterDataWrapper: Codable {
    let data: CharacterDataContainer
}

// MARK: - CharacterDataContainer
struct CharacterDataContainer: Codable {
    let results: [Character]
}

// MARK: - Character
struct Character: Codable, Identifiable{
    let id: Int
    let name, description, modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
