//
//  PlaylistView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI
import SwiftData

struct PlaylistView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @Binding var numCoins: Int
    @State var textInput: String = ""
    @State var answerIsCorrect: Int = -1
    @State var currentSong: String = ""
    @State var currentArtist: String = ""
    let songs = ["Blinding Lights","Shape of You","Levitating","Uptown Funk","Stay","Bad Guy","Rolling in the Deep","Shallow","Old Town Road","Peaches","Good 4 U","Watermelon Sugar","Save Your Tears"]
    let songsArtists = [
        "Blinding Lights": "The Weeknd",
        "Shape of You": "Ed Sheeran",
        "Levitating": "Dua Lipa",
        "Uptown Funk": "Mark Ronson ft. Bruno Mars",
        "Stay": "Kid LAROI & Justin Bieber",
        "Bad Guy": "Billie Eilish",
        "Rolling in the Deep": "Adele",
        "Shallow": "Lady Gaga & Bradley Cooper",
        "Old Town Road": "Lil Nas X",
        "Peaches": "Justin Bieber ft. Daniel Caesar & Giveon",
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
                VStack {
                    ZStack {
                        ForEach(0..<13) { i in
                            QuestionCardView(song: songs[i], artist: songsArtists[songs[i]]!, textInput: $textInput, answerIsCorrect: $answerIsCorrect)
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
                                
                                if textInput == "Poop" {
                                    answerIsCorrect = 1
                                } else {
                                    answerIsCorrect = 0
                                }
                                
                                print("submitted")
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
        }
    }
    /*
    private func sendRequest(completion: @escaping (String) async -> Void) async {
        let url = URL(string: "https://accounts.spotify.com/api/token")!
        
        // Create request body parameters
        let parameters = [
            "grant_type": "client_credentials",
            "client_id": "64fc8126c5bc403cb586f58b9c859ed9",
            "client_secret": "2bc179f59822443a9aa5a9a4598d7c44"
        ]
        let bodyString = parameters.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = bodyString.data(using: .utf8)
        
        do {
            
        } catch {
            print("Error: \(error)")
            await completion("")
        }
    }
     */
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    PlaylistView(numCoins: .constant(0))
}
