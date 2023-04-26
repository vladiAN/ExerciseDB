//
//  LikedView.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 25.04.2023.
//

import SwiftUI

struct LikedView: View {
    @State private var selectedTab: CustomTab = .liked

    var body: some View {
        ZStack {
            Color.red
                .edgesIgnoringSafeArea(.all)

            Text("LikedView")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

struct LikedView_Previews: PreviewProvider {
    static var previews: some View {
        LikedView()
    }
}

