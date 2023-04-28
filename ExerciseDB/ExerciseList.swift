//
//  ExerciseList.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 27.04.2023.
//

import SwiftUI

struct ExerciseList: View {
    var nameLink: String

    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)

            Text(nameLink)
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

