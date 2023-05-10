//
//  ContentView.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 25.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: CustomTab = .home
    let colorBackground = #colorLiteral(red: 0.368512094, green: 0.1596673727, blue: 0.4955242872, alpha: 1)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(colorBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                
                switch selectedTab {
                case .search:
                    SearchScreen()
                case .home:
                    HomeView()
                case .liked:
                    LikedView()
                }
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
