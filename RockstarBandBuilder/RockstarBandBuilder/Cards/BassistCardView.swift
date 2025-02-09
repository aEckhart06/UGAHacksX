//
//  BassistCardView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI

struct BassistCardView: View {
    var cardWidth: CGFloat
    @Binding var musician: Character?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if let musician = musician {
                Image(uiImage: musician.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                HStack {
                    VStack(alignment: .leading) {
                        Text(musician.name)
                            .fontWeight(.bold)
                        Text("Bassist")
                            .fontWeight(.heavy)
                        
                    }
                    .foregroundStyle(.white)
                    .padding()
                    Spacer()
                }
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(style: StrokeStyle(lineWidth: 3, dash: [10, 5]))
                    .fill(.gray.opacity(0.4))
                
                    .frame(width: cardWidth, height: cardWidth)
                    .overlay {
                        Text("Lead Bassist")
                            .foregroundStyle(.white)
                    }
            }
            
        }
        .frame(width: cardWidth, height: 200)
        .onTapGesture {
            musician = nil
        }
    }
}


