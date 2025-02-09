//
//  GuitaristCardView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI

struct GuitaristCardView: View {
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
                    Text("Guitarist")
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
                        Text("Lead Guitarist")
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
    GuitaristCardView(cardWidth: UIScreen.main.bounds.width / 2 * 0.8, musician: .constant(nil))
}
