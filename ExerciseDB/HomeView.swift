//
//  HomeView.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 25.04.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: CustomTab = .home
    @State private var isBodyCell = true
    let colorBackground = #colorLiteral(red: 0.368512094, green: 0.1596673727, blue: 0.4955242872, alpha: 1)

    let bodyPartsArray: [String] = [
        "back",
        "cardio",
        "chest",
        "lower arms",
        "lower legs",
        "neck",
        "shoulders",
        "upper arms",
        "upper legs",
        "waist",
    ]
    
    let musclesPartsArray: [String] = [
        "abductors",
        "abs",
        "adductors",
        "biceps",
        "calves",
        "cardiovascular system",
        "delts",
        "forearms",
        "glutes",
        "hamstrings",
        "lats",
        "levator scapulae",
        "pectorals",
        "quads",
        "serratus anterior",
        "spine",
        "traps",
        "triceps",
        "upper back",
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Color(colorBackground)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    BodyMusclesTogle(isBodyCell: $isBodyCell)
                    Spacer(minLength: 18)
                    if isBodyCell {
                        PartList(partsArray: bodyPartsArray)
                    } else {
                        PartList(partsArray: musclesPartsArray)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
