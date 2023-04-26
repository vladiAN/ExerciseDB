//
//  HomeView.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 25.04.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: CustomTab = .home
    
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)

            Text("HomeView")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
