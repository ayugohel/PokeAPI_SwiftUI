//
//  PokemonList.swift
//  PokeAPI-SwiftUI
//
//  Created by Ayushi on 2024-05-09.
//

import SwiftUI

struct PokemonList: View {
    @ObservedObject var loader: PokemonAPILoader
    
    var body: some View {
        List {
            ForEach(loader.pokemonData) { pokemon in
                PokemonCell(pokemon: pokemon)
            }
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList(loader: PokemonAPILoader())
    }
}
