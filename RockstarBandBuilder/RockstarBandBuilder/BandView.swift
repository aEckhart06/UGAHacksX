//
//  ContentView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI


struct BandView: View {
    
    let cardWidth = UIScreen.main.bounds.width / 2 * 0.8
    @State var leadSinger: Character? = nil
    @State var leadGuitarist: Character? = nil
    @State var leadDrummer: Character? = nil
    @State var leadBassist: Character? = nil
    @Binding var numCoins: Int
    @State var addPlayerView: Bool = false
    @State var selectedMusician: Character? = nil
    @State var musicians: [Character] = Characters().characters

    var body: some View {
        
            
            
        NavigationView {
            
            ZStack {
                // Add gradient background
                LinearGradient(
                    gradient: Gradient(colors: [.purple, .black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
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
                        HStack {
                            Text("\(numCoins)")
                                .foregroundStyle(.white)
                                .font(.title3)
                                .bold()
                            Image(uiImage: .rCoin)
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                    }
                    
                }
                .toolbarBackground(.purple, for: .navigationBar)
                
                
                
                
                
                // Message View
                if addPlayerView {
                    Color.black.opacity(0.5).ignoresSafeArea(.all)
                    if let selectedMusician = self.selectedMusician {
                        addMusician(player: selectedMusician)
                    }
                }
            }
        }
        
        
        
    }

    
    @ViewBuilder
    private func addMusician(player: Character) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 300, height: 400)
            .foregroundStyle(player.rarity == "gold" ? .appgold : player.rarity == "purple" ? .apppurple : player.rarity == "green" ? .appgreen : .appgray)
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
                                    .font(.system(size: 20))
                                    .foregroundStyle(.red)
                                    .bold()
                                    .padding()
                                    .background(content: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundStyle(.gray)
                                            .opacity(0.7)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(lineWidth: 2)
                                                    .foregroundStyle(.black)
                                            }
                                    })
                            }
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Button {
                                if player.position == "singer" {
                                    leadSinger = player
                                } else if player.position == "guitarist" {
                                    leadGuitarist = player
                                } else if player.position == "drummer" {
                                    leadDrummer = player
                                } else if player.position == "bassist" {
                                    leadBassist = player
                                }
                                addPlayerView = false
                            } label: {
                                Text("Add Musician")
                                    .foregroundStyle(.black)
                                    .bold()
                                    .padding()
                                    .background(content: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundStyle(.gray)
                                            .opacity(0.7)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(lineWidth: 2)
                                                    .foregroundStyle(.black)
                                            }
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
