//
//  CardView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI

struct CardView: View {
    var musician: Character
    var cardWidth = UIScreen.main.bounds.width - 20
    var cardHeight = UIScreen.main.bounds.height / 1.45
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(uiImage: musician.image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            InfoView(musician: musician)
                .padding()
                .foregroundStyle(.white)
        }
        .frame(width: cardWidth, height: cardHeight)
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .gesture(
            TapGesture()
                .onEnded({ Void in
                    withAnimation {
                        xOffset = -500
                        degrees = -5
                    }
                })
        )
        
    }
}
struct InfoView: View {
    var musician: Character
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(musician.name)
                    .bold()
                Text(musician.position)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("Rarity: \(musician.rarity)")
                    .bold()
                Text(musician.genre)
            }
        }
    }
}

#Preview {
    CardView(musician: Character(name: "Luke Brian", position: "Guitarist", genre: "Country", rarity: "purple", image: .goldPopSinger1, inUse: false))
}
