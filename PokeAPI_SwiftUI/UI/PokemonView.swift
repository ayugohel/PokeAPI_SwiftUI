//
//  ContentView.swift
//  PokeAPI-SwiftUI
//
//  Created by Ayushi on 2024-05-09.
//

import SwiftUI

struct PokemonView: View {
    @StateObject private var loader = PokemonAPILoader()
    
    var body: some View {
        NavigationView {
            PokemonList(loader: loader)
                .navigationTitle("Pokemon List")
                .task {
                    await loader.loadPokemonData()
                }
                .refreshable {
                    await loader.loadPokemonData()
                }
        }
        
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
