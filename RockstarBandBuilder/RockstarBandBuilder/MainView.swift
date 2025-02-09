//
//  MainView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI

struct MainView: View {
    @State var numCoins: Int = 0
    var body: some View {
        
        ZStack {
            VStack{
                TabView {
                    Tab {
                        BandView(numCoins: $numCoins)
                    } label: {
                        Image(systemName: "person")
                            .padding()
                    }
                    
                    Tab {
                        PlaylistView(numCoins: $numCoins)
                    } label: {
                        Image(systemName: "play")
                    }
                    
                    Tab {
                        PackView(numCoins: $numCoins)
                    } label: {
                        Image(systemName: "rectangle")
                    }
                    
                }
                
                
                
            }
            
        }
    }
}

#Preview {
    MainView()
}
