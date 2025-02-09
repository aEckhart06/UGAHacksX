//
//  MainView.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import SwiftUI

struct MainView: View {
    @State var numCoins: Int = 20
    @State var appData: AppData = AppData()
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.black // Set the background color
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white // Change icon color when selected
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white] // Change title color when selected
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        
        ZStack {
            VStack{
                TabView {
                    Tab {
                        BandView(numCoins: $numCoins, appData: $appData)
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
                        PackView(numCoins: $numCoins, appData: $appData)
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
