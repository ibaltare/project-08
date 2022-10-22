//
//  ComicModel.swift
//  Practica
//
//  Created by Nicolas on 20/10/22.
//

import Foundation

// MARK: - ComicDataWrapper
struct ComicDataWrapper: Codable {
    let data: ComicDataContainer
}

// MARK: - ComicDataContainer
struct ComicDataContainer: Codable {
    let results: [Comic]
}

// MARK: - Comic
struct Comic: Codable, Identifiable {
    let id: Int
    let title: String
    let variantDescription: String
    let description: String?
    let resourceURI: String
    let thumbnail: Thumbnail
    let images: [Thumbnail]
}
