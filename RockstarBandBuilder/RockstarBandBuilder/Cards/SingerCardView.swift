//
//  SingerCardView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI

struct SingerCardView: View {
    var cardWidth: CGFloat
    @Binding var musician: Musician?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if let musician = musician {
                Image(uiImage: musician.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                HStack {
                    Text(musician.name)
                        .fontWeight(.heavy)
                    Spacer()
                    Text("Singer")
                        .fontWeight(.heavy)
                    
                }
                .foregroundStyle(.white)
                .padding()
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(style: StrokeStyle(lineWidth: 3, dash: [10, 5]))
                    .fill(.gray.opacity(0.6))
                
                    .frame(width: cardWidth, height: 200)
                    .overlay {
                        Text("Lead Singer")
                    }
            }
            
        }
        .frame(width: cardWidth, height: 200)
        .onTapGesture {
            musician = nil
        }
    }
}

#Preview {
    SingerCardView(cardWidth: UIScreen.main.bounds.width / 2 * 0.8, musician: .constant(Musician(name: "Drew", position: "Singer", rarity: 3, genre: "Country")))
}
