//
//  Pokemon.swift
//  PokeAPI-SwiftUI
//
//  Created by Ayushi on 2024-05-09.
//

import Foundation

struct PokemonResponse: Decodable {
    let results: [Pokemon]
}

struct Pokemon: Decodable, Identifiable {
    let name: String
    let url: String
    
    var id: Int? {
        return Int(url.split(separator: "/").last?.description ?? "0")
    }
    
    var imageUrl: URL? {
        return URL(string: "https://img.pokemondb.net/artwork/large/\(name).jpg")
    }
}
