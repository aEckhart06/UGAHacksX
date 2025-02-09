//
//  QuestionCardView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI

struct QuestionCardView: View {
    var song: String
    var artist: String
    @Binding var textInput: String
    @Binding var answerIsCorrect: Int
    
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var borderColor: Color = .black
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.white)
            RoundedRectangle(cornerRadius: 25)
                .stroke(lineWidth: 2)
                .foregroundStyle(borderColor)
            VStack {
                Text("Who is the artist or band that made this song?")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding()
                Text(song)
                    .font(.title)
                    .bold()
                    .padding()
            }
            
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: 300)
        .padding(.vertical)
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .onChange(of: answerIsCorrect) { oldValue, newValue in
            print("test")
            print(answerIsCorrect)
            if answerIsCorrect == 1 {
                withAnimation {
                    xOffset = 500
                    degrees = 5
                    borderColor = .green
                }
            } else if answerIsCorrect == 0 {
                withAnimation {
                    xOffset = -500
                    degrees = -5
                    borderColor = .red
                }
            }
            
        }
    }
}


#Preview {
    QuestionCardView(song: "poop", artist: "pee", textInput: .constant(""), answerIsCorrect: .constant(-1))
}
