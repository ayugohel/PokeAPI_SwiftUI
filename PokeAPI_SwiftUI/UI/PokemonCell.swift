//
//  PokemonCell.swift
//  PokeAPI-SwiftUI
//
//  Created by Ayushi on 2024-05-09.
//

import SwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon
    private let cellsize = 70.0
    private let imagesize = 50.0
    
    var body: some View {
        HStack {
            AsyncImage(url: pokemon.imageUrl) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "slowmo")
                    .resizable()
            }
            .padding(.trailing, 10)
            .frame(width: imagesize, height: imagesize)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            
            Text(pokemon.name.capitalized)
                .font(.subheadline)
                .fontWeight(.bold)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: cellsize)
    }
}


struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1.png"))
    }
}
