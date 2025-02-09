//
//  PackView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI

struct PackView: View {
    @Binding var numCoins: Int
    var cardWidth = UIScreen.main.bounds.width - 20
    var cardHeight = UIScreen.main.bounds.height / 1.45
    @State var isOpening: Bool = false
    var musicians: [Character] = Characters().characters
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea(.all)
                if !isOpening {
                    VStack {
                        Image(.rockstarpackcover)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                        
                        
                        Button {
                            withAnimation {
                                isOpening = true
                            }
                            
                        } label: {
                            Text("Open")
                                .foregroundStyle(.black)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.gray.opacity(0.5))
                                }
                        }
                        .padding()
                    }
                }
                if isOpening {
                    Color.black.opacity(0.7).ignoresSafeArea(.all)
                    openPack(musicians: musicians)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Coins: \(numCoins)")
                }
            }
        }
        
    }
    @ViewBuilder
    private func openPack(musicians: [Character]) -> some View {
        
        ZStack {
            Button {
                withAnimation {
                    isOpening = false
                }
            } label: {
                Text("Rock On!")
                    .bold()
                    .foregroundStyle(.white)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.gray)
                    }
            }
            ForEach(0..<5) { i in
                CardView(musician: musicians[i])
            }
            
        }
        
            
            
            
    }
}

#Preview {
    PackView(numCoins: .constant(0))
}
