//
//  ContentView.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 25.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: CustomTab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .search:
                SearchView()
            case .home:
                HomeView()
            case .liked:
                LikedView()
            }
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
