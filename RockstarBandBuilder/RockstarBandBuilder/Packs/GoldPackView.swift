//
//  GoldPackView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/9/25.
//

import SwiftUI

struct GoldPackView: View {
    let coverImage: UIImage = .rockstarpackcover
    var elements: [Character] = Characters().characters
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    private func sortGoldPack(count: Int) -> [Character] {
        var packList: [Character] = []
        var randomNumber = Int.random(in: 1..<count)  // Random number
        while packList.count < 2 {
            if elements[randomNumber].rarity == "green" {
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
        }
        while packList.count < 4 {
            if elements[randomNumber].rarity == "green" || elements[randomNumber].rarity == "purple" || elements[randomNumber].rarity == "gold" {
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
        }
        while packList.count < 5 {
            if elements[randomNumber].rarity == "gold" {
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
        }
        return packList
    }
}

#Preview {
    GoldPackView()
}
