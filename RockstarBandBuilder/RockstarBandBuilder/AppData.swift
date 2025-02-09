//
//  Data.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import Foundation
import UIKit
import SwiftUI

class AppData {
    var userMusicians: [Character] = [Character(name: "Zoe Lane", position: "singer", genre: "rock", rarity: "gray", image: .greyRockSinger1, inUse: false), Character(name: "Nathan Brooks", position: "guitarist", genre: "rap", rarity: "gray", image: .greyRapGuitarist1, inUse: false), Character(name: "Liam Hayes", position: "bassist", genre: "country", rarity: "gray", image: .greyCountryBassist1, inUse: false), Character(name: "Mia Harmon", position: "drummer", genre: "rock", rarity: "gray", image: .greyRockDrummer1, inUse: false)]
    
}


struct Character: View, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let position: String
    let genre: String
    let rarity: String
    let image: UIImage
    var inUse: Bool
    
    var body: some View {
        HStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .bold()
                    Text(position)
                        
                }
                .foregroundStyle(.white)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Rarity: \(rarity)")
                        .bold()
                    Text(genre)
                }
                .foregroundStyle(.white)
            }
            .padding(.horizontal)
            Spacer()
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 50, height: 50)
        }
        .padding(.horizontal)
    }
}

struct Characters {
    
    let characters: [Character] = [
        Character(name: "Jake Monroe", position: "singer", genre: "rock", rarity: "gold", image: .goldRockSinger1, inUse: false),
        Character(name: "Sophia Carter", position: "drummer", genre: "pop", rarity: "purple", image: .purplePopDrummer1, inUse: false),
        Character(name: "Noah Reed", position: "guitarist", genre: "rap", rarity: "green", image: .greenRapGuitarist1, inUse: false),
        Character(name: "Liam Hayes", position: "bassist", genre: "country", rarity: "gray", image: .greyCountryBassist1, inUse: false),
        Character(name: "Ava Kingston", position: "singer", genre: "pop", rarity: "gold", image: .goldPopSinger1, inUse: false),
        Character(name: "Mason Drake", position: "drummer", genre: "rock", rarity: "green", image: .greenRockDrummer1, inUse: false),
        Character(name: "Olivia Woods", position: "guitarist", genre: "country", rarity: "purple", image: .purpleCountryGuitarist1, inUse: false),
        Character(name: "Ethan Scott", position: "bassist", genre: "rap", rarity: "gold", image: .goldRapBassist1, inUse: false),
        Character(name: "Zoe Lane", position: "singer", genre: "rock", rarity: "gray", image: .greyRockSinger1, inUse: false),
        Character(name: "Lucas Stone", position: "drummer", genre: "pop", rarity: "purple", image: .purplePopDrummer2, inUse: false),
        Character(name: "Nathan Brooks", position: "guitarist", genre: "rap", rarity: "gray", image: .greyRapGuitarist1, inUse: false),
        Character(name: "Aria Ray", position: "bassist", genre: "country", rarity: "green", image: .greenCountryBassist1, inUse: false),
        Character(name: "Sebastian Reed", position: "singer", genre: "pop", rarity: "purple", image: .purplePopSinger2, inUse: false),
        Character(name: "Mia Harmon", position: "drummer", genre: "rock", rarity: "gray", image: .greyRockDrummer1, inUse: false),
        Character(name: "Owen Carter", position: "guitarist", genre: "rap", rarity: "purple", image: .purpleRapGuitarist1, inUse: false),
        Character(name: "Grace Monroe", position: "bassist", genre: "country", rarity: "gray", image: .greyCountryBassist2, inUse: false),
        Character(name: "Logan Santos", position: "singer", genre: "rock", rarity: "green", image: .greenRockSinger1, inUse: false),
        Character(name: "Isabella West", position: "drummer", genre: "pop", rarity: "gray", image: .greyPopDrummer1, inUse: false),
        Character(name: "Noah Drake", position: "guitarist", genre: "rap", rarity: "gold", image: .goldRapGuitarist1, inUse: false),
        Character(name: "Chloe Vance", position: "bassist", genre: "country", rarity: "purple", image: .purpleCountryBassist1, inUse: false),
        Character(name: "Ethan Lane", position: "singer", genre: "pop", rarity: "gray", image: .greyPopSinger1, inUse: false),
        Character(name: "Olivia Scott", position: "drummer", genre: "rock", rarity: "purple", image: .purpleRockDrummer1, inUse: false),
        Character(name: "Nathan Brooks", position: "guitarist", genre: "rap", rarity: "green", image: .greenRapGuitarist2, inUse: false),
        Character(name: "Ava Knight", position: "bassist", genre: "country", rarity: "green", image: .greenCountryBassist2, inUse: false),
        Character(name: "Mason Reed", position: "singer", genre: "pop", rarity: "purple", image: .purplePopSinger2, inUse: false),
        Character(name: "Sophia Monroe", position: "drummer", genre: "rock", rarity: "gray", image: .greyRockDrummer2, inUse: false),
        Character(name: "Jake Carter", position: "guitarist", genre: "rap", rarity: "purple", image: .purpleRapGuitarist2, inUse: false),
        Character(name: "Emily Woods", position: "bassist", genre: "country", rarity: "gold", image: .goldCountryBassist1, inUse: false),
        Character(name: "Liam Flynn", position: "singer", genre: "rock", rarity: "green", image: .greenRockSinger2, inUse: false),
        Character(name: "Zoe Ray", position: "drummer", genre: "pop", rarity: "gray", image: .greyPopDrummer2, inUse: false),
        Character(name: "Lucas Kingston", position: "drummer", genre: "rap", rarity: "gold", image: .goldRapDrummer1, inUse: false),
        Character(name: "Aria Hayes", position: "bassist", genre: "country", rarity: "purple", image: .purpleCountryBassist2, inUse: false),
        Character(name: "Sebastian Harmon", position: "singer", genre: "pop", rarity: "gray", image: .greyPopSinger2, inUse: false),
        Character(name: "Mia Carter", position: "drummer", genre: "rock", rarity: "purple", image: .purpleRockDrummer2, inUse: false),
        Character(name: "Owen Foster", position: "guitarist", genre: "rap", rarity: "gray", image: .greyRapGuitarist2, inUse: false),
        Character(name: "Grace Lane", position: "bassist", genre: "country", rarity: "green", image: .greenCountryBassist3, inUse: false),
        Character(name: "Logan Scott", position: "singer", genre: "pop", rarity: "gray", image: .greyPopSinger3, inUse: false),
        Character(name: "Isabella Reed", position: "drummer", genre: "rock", rarity: "purple", image: .purpleRockDrummer3, inUse: false)]
}
