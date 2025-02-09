//
//  PlaylistView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI

struct PlaylistView: View {
    @Binding var numCoins: Int
    @State var textInput: String = ""
    @State var answerIsCorrect: Int = -1
    @State var currentSong: String = ""
    @State var currentArtist: String = ""
    @State var isPlaying: Bool = false
    @State var numQuestionsAnswered: Int = 0
    let songs = ["Blinding Lights","Shape of You","Levitating","Uptown Funk","Stay","Bad Guy","Rolling in the Deep","Shallow","Old Town Road","Peaches","Good 4 U","Watermelon Sugar","Save Your Tears"]
    let songsArtists = [
        "Blinding Lights": "The Weeknd",
        "Shape of You": "Ed Sheeran",
        "Levitating": "Dua Lipa",
        "Uptown Funk": "Bruno Mars",
        "Stay": "Kid LAROI",
        "Bad Guy": "Billie Eilish",
        "Rolling in the Deep": "Adele",
        "Shallow": "Lady Gaga",
        "Old Town Road": "Lil Nas X",
        "Peaches": "Justin Bieber",
        "Good 4 U": "Olivia Rodrigo",
        "Watermelon Sugar": "Harry Styles",
        "Save Your Tears": "The Weeknd"
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.purple, .black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                .onTapGesture {
                    Utils().dismissKeyboard()
                }
                VStack {
                    if !isPlaying {
                        Button {
                            withAnimation {
                                isPlaying = true
                                numQuestionsAnswered = 0
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundStyle(.white)
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(lineWidth: 2)
                                    .foregroundStyle(.black)
                                    .overlay {
                                        VStack {
                                            Text("How many songs do you know?")
                                                .font(.title)
                                                .fontWeight(.semibold)
                                                .multilineTextAlignment(.center)
                                                .padding()
                                            Text("Click to play!")
                                                .font(.title)
                                                .fontWeight(.semibold)
                                        }
                                        
                                    }
                            }
                            .frame(width: UIScreen.main.bounds.width - 50, height: 300)
                            .padding(.vertical)
                        }
                        .foregroundStyle(.black)
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundStyle(.white)
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.black)
                                .overlay {
                                    VStack {
                                        Text("Who is the artist or band that made this song?")
                                            .font(.title)
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding()
                                        Text(songs[numQuestionsAnswered])
                                            .font(.title)
                                            .fontWeight(.semibold)
                                    }
                                    
                                }
                        }
                        .frame(width: UIScreen.main.bounds.width - 50, height: 300)
                        .padding(.vertical)
                        .onTapGesture {
                            Utils().dismissKeyboard()
                        }
                    }
                    ZStack {
                        
                        HStack {
                            TextField("Artist", text: $textInput)
                                .bold()
                                .foregroundStyle(.white)
                                .frame(height: 50)
                                .padding(8)
                            Button {
                                if textInput == songsArtists[songs[numQuestionsAnswered]]! {
                                    numCoins += 1
                                }
                                if numQuestionsAnswered < songs.count - 1 {
                                    withAnimation {
                                        numQuestionsAnswered += 1
                                    }
                                } else {
                                    withAnimation {
                                        numQuestionsAnswered = 0
                                        isPlaying = false
                                    }
                                }
                                textInput = ""
                                
                            } label: {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.gray.opacity(0.2))
                    }
                }
            }
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
        }
    }
}

#Preview {
    PlaylistView(numCoins: .constant(0))
}
