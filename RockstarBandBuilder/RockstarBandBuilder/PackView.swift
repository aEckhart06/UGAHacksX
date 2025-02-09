//
//  PackView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI

struct PackView: View {
    @Binding var numCoins: Int
    @Binding var appData: AppData
    var cardWidth = UIScreen.main.bounds.width / 2 * 0.9
    var cardHeight = UIScreen.main.bounds.height / 1.45
    @State var isOpening: Bool = false
    @State var musicians: [Character] = Characters().characters
    var elements: [Character] = Characters().characters
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.purple, .black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                if !isOpening {
                    VStack {
                        Text("Rockstar Packs")
                            .bold()
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                        VStack {
                            HStack(spacing: 20) {
                                Button {
                                    if numCoins > 4 {
                                        musicians = sortGrayPack(count: elements.count)
                                        for i in musicians {
                                            var same = false
                                            for x in appData.userMusicians {
                                                if i.name == x.name {
                                                    same = true
                                                    break
                                                }
                                            }
                                            if !same {
                                                appData.userMusicians.append(i)
                                            }
                                        }
                                        withAnimation {
                                            isOpening = true
                                        }
                                        numCoins -= 5
                                    }
                                } label: {
                                    ZStack(alignment: .bottom) {
                                        Image(uiImage: .grayPack)
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .frame(width: cardWidth, height: 250)
                                            .shadow(color: .appgray ,radius: 7)
                                        HStack {
                                            Spacer()
                                            Text("5")
                                                .foregroundStyle(.white)
                                                .font(.title3)
                                                .bold()
                                            Image(uiImage: .rCoin)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        .offset(x: 5,y: -5)
                                        .padding()
                                    }
                                }
                                
                                
                                
                                Button {
                                    if numCoins > 7 {
                                        musicians = sortGreenPack(count: elements.count)
                                        for i in musicians {
                                            var same = false
                                            for x in appData.userMusicians {
                                                if i.name == x.name {
                                                    same = true
                                                    break
                                                }
                                            }
                                            if !same {
                                                appData.userMusicians.append(i)
                                            }
                                        }
                                        withAnimation {
                                            isOpening = true
                                        }
                                        numCoins -= 8
                                    }
                                } label: {
                                    ZStack(alignment: .bottom) {
                                        Image(uiImage: .greenPack)
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .frame(width: cardWidth, height: 250)
                                            .shadow(color: .appgreen ,radius: 7)
                                        HStack {
                                            Spacer()
                                            Text("8")
                                                .foregroundStyle(.white)
                                                .font(.title3)
                                                .bold()
                                            Image(uiImage: .rCoin)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        .offset(x: 5,y: -5)
                                        .padding()
                                    }
                                }
                                
                            }
                            .padding()
                            HStack(spacing: 20) {
                                Button {
                                    if numCoins > 11 {
                                        musicians = sortPurplePack(count: elements.count)
                                        for i in musicians {
                                            var same = false
                                            for x in appData.userMusicians {
                                                if i.name == x.name {
                                                    same = true
                                                    break
                                                }
                                            }
                                            if !same {
                                                appData.userMusicians.append(i)
                                            }
                                        }
                                        withAnimation {
                                            isOpening = true
                                        }
                                        numCoins -= 12
                                    }
                                } label: {
                                    ZStack(alignment: .bottom) {
                                        Image(uiImage: .purplePack)
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .frame(width: cardWidth, height: 250)
                                            .shadow(color: .apppurple ,radius: 7)
                                        HStack {
                                            Spacer()
                                            Text("12")
                                                .foregroundStyle(.white)
                                                .font(.title3)
                                                .bold()
                                            Image(uiImage: .rCoin)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        .offset(x: 5,y: -5)
                                        .padding()
                                    }
                                }
                                
                                Button {
                                    if numCoins > 14 {
                                        musicians = sortGoldPack(count: elements.count)
                                        for i in musicians {
                                            var same = false
                                            for x in appData.userMusicians {
                                                if i.name == x.name {
                                                    same = true
                                                    break
                                                }
                                            }
                                            if !same {
                                                appData.userMusicians.append(i)
                                            }
                                        }
                                        
                                        withAnimation {
                                            isOpening = true
                                            
                                        }
                                        numCoins -= 15
                                    }
                                } label: {
                                    ZStack(alignment: .bottom) {
                                        Image(uiImage: .goldPack)
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .frame(width: cardWidth, height: 250)
                                            .shadow(color: .appgold ,radius: 7)
                                        HStack {
                                            Spacer()
                                            Text("15")
                                                .foregroundStyle(.white)
                                                .font(.title3)
                                                .bold()
                                            Image(uiImage: .rCoin)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        .offset(x: 5,y: -5)
                                        .padding()
                                    }
                                }
                            }
                            .padding()
                        }
                        .padding()
                        .padding(.bottom)
                    }
                }
                if isOpening {
                    Color.black.opacity(0.7).ignoresSafeArea(.all)
                    openPack(characters: musicians)
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
    @ViewBuilder
    private func openPack(characters: [Character]) -> some View {
        
        ZStack {
            Button {
                withAnimation {
                    isOpening = false
                    musicians = elements
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.purple)
                        .shadow(color: .white ,radius: 7)
                    Text("ROCK ON!")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                }
                .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.width - 20)
            }
            ForEach(0..<5) { i in
                CardView(musician: characters[i])
            }
            
        }
    }
    private func sortGoldPack(count: Int) -> [Character] {
        var packList: [Character] = []
        var randomNumber = Int.random(in: 1..<count)  // Random number
        while packList.count < 1 {
            if elements[randomNumber].rarity == "gold" {
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
            
        }
        while packList.count < 3 {
            if elements[randomNumber].rarity == "purple" || elements[randomNumber].rarity == "gold" {
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
        }
        while packList.count < 5 {
            if elements[randomNumber].rarity == "purple" || elements[randomNumber].rarity == "green"{
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
        }
        return packList
    }
    private func sortPurplePack(count: Int) -> [Character] {
        var packList: [Character] = []
        var randomNumber = Int.random(in: 1..<count)  // Random number
        while packList.count < 1 {
            if elements[randomNumber].rarity != "green" && elements[randomNumber].rarity != "gray" {
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
            
        }
        while packList.count < 4 {
            if elements[randomNumber].rarity == "purple" || elements[randomNumber].rarity == "green" {
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
        }
        while packList.count < 5 {
            if elements[randomNumber].rarity != "gold" && elements[randomNumber].rarity != "purple" {
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
        }
        return packList
    }
    private func sortGreenPack(count: Int) -> [Character] {
        var packList: [Character] = []
        var randomNumber = Int.random(in: 1..<count)  // Random number
        while packList.count < 1 {
            if elements[randomNumber].rarity == "purple" || elements[randomNumber].rarity == "green"{
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
            
        }
        while packList.count < 4 {
            if elements[randomNumber].rarity == "gray" || elements[randomNumber].rarity == "green" {
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
        }
        while packList.count < 5 {
            if elements[randomNumber].rarity == "gray" {
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
        }
        return packList
    }
    private func sortGrayPack(count: Int) -> [Character] {
        var packList: [Character] = []
        var randomNumber = Int.random(in: 1..<count)  // Random number
        while packList.count < 1 {
            if elements[randomNumber].rarity != "gold" {
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
            
        }
        while packList.count < 4 {
            if elements[randomNumber].rarity == "gray" || elements[randomNumber].rarity == "green" {
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
        }
        while packList.count < 5 {
            if elements[randomNumber].rarity == "gray" {
                packList.append(elements[randomNumber])
            }
            randomNumber = Int.random(in: 1..<count)
        }
        return packList
    }
}

#Preview {
    PackView(numCoins: .constant(0), appData: .constant(AppData()))
}
