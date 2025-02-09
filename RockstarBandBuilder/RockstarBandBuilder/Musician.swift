//
//  Musician.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI

struct Musician: View, Identifiable, Hashable {
    let id = UUID()
    
    var name: String
    var position: String
    var rarity: Int
    var genre: String
    //var image: UIImage = .rockstarguitarplayer
    
    var body: some View {
        HStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .bold()
                    Text(position)
                        
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Rarity: \(rarity)")
                        .bold()
                    Text(genre)
                }
            }
            .padding(.horizontal)
            Spacer()
            /*
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 50, height: 50)
             */
        }
        .padding(.horizontal)
    }
}

#Preview {
    Musician(name: "Michael Jackson", position: "Singer", rarity: 5, genre: "Rock")
}
