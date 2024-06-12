//
//  PokemonAPILoader.swift
//  PokeAPI-SwiftUI
//
//  Created by Ayushi on 2024-05-09.
//

import Foundation
import Combine

enum PokeError: Error {
    case internalServerError
    case noDataFound
    case invalidURL
}


class PokemonAPILoader: ObservableObject {
    @Published private(set) var pokemonData: [Pokemon] = []

    private let urlSession = URLSession(configuration: .default)
    
    func getPokemonsData() async throws -> [Pokemon] {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { throw PokeError.invalidURL }
        let (data, response) = try await urlSession.data(from: url)

        guard (response as? HTTPURLResponse)?.statusCode == 200
        else { throw PokeError.internalServerError }
        
        guard let decoded = try? JSONDecoder().decode(PokemonResponse.self, from: data)
        else { throw PokeError.noDataFound }

        print(try! JSONDecoder().decode(PokemonResponse.self, from: data))

        return decoded.results
    }
    
    
    @MainActor func loadPokemonData() async {
        do {
            pokemonData = try await getPokemonsData()
        } catch {
            print("error: ",error)
        }
    }

}

