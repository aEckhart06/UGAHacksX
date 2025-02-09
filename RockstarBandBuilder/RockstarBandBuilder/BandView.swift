//
//  ContentView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI


struct BandView: View {
    
    let cardWidth = UIScreen.main.bounds.width / 2 * 0.8
    @State var leadSinger: Musician? = nil
    @State var leadGuitarist: Musician? = nil
    @State var leadDrummer: Musician? = nil
    @State var leadBassist: Musician? = nil
    @Binding var numCoins: Int
    @State var addPlayerView: Bool = false
    @State var selectedMusician: Musician? = nil
    @State var musicians: [Musician] = [
        Musician(name: "Luke Brian", position: "Guitarist", rarity: 4, genre: "Country"),
        Musician(name: "Kanye West", position: "Singer", rarity: 5, genre: "Rap"),
        Musician(name: "Taylor Swift", position: "Singer", rarity: 5, genre: "Pop"),
        Musician(name: "Andrew Primiano", position: "Drummer", rarity: 1, genre: "Rock"),
        Musician(name: "Luke Katz", position: "Bassist", rarity: 1, genre: "Country")
    ]

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(.all)
            NavigationView {
                ScrollView(.vertical) {
                    
                    HStack(spacing: 20) {
                        SingerCardView(cardWidth: cardWidth, musician: $leadSinger)
                        
                        GuitaristCardView(cardWidth: cardWidth, musician: $leadGuitarist)
                    }
                    .padding()
                    HStack(spacing: 20) {
                        DrummerCardView(cardWidth: cardWidth, musician: $leadDrummer)
                        BassistCardView(cardWidth: cardWidth, musician: $leadBassist)
                    }
                    .padding()
                    VStack {
                        
                        ForEach(musicians, id: \.self) { musician in
                            
                            Button {
                                addPlayerView = true
                                selectedMusician = musician
                            } label: {
                                musician
                            }
                            .foregroundStyle(.black)
                        }
                        
                        
                        
                    }
                    .padding(0)
                }
                .disabled(addPlayerView)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Text("Coins: \(numCoins)")
                    }
                }
            }
            // Message View
            if addPlayerView {
                Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
                if let selectedMusician = self.selectedMusician {
                    addMusician(player: selectedMusician)
                }
            }
            
        }
    }

    
    @ViewBuilder
    private func addMusician(player: Musician) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 300, height: 400)
            .foregroundStyle(.white)
            .shadow(radius: 5)
            .overlay {
                VStack {
                    
                    CardView(musician: player, cardWidth: 270, cardHeight: 300)
                    HStack {
                        VStack(alignment: .leading) {
                            Button {
                                addPlayerView = false
                            } label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundStyle(.red)
                                    .padding()
                                    .background(content: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundStyle(.gray)
                                            .opacity(0.2)
                                    })
                            }
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Button {
                                
                                if player.position == "Singer" {
                                    leadSinger = player
                                } else if player.position == "Guitarist" {
                                    leadGuitarist = player
                                } else if player.position == "Drummer" {
                                    leadDrummer = player
                                } else if player.position == "Bassist" {
                                    leadBassist = player
                                }
                                addPlayerView = false
                            } label: {
                                Text("Add Musician")
                                    .foregroundStyle(.black)
                                    .padding()
                                    .background(content: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundStyle(.gray)
                                            .opacity(0.2)
                                    })
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
    }
    
}

#Preview {
    BandView(numCoins: .constant(0))
        .modelContainer(for: Item.self, inMemory: true)
}
