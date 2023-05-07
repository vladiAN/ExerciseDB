//
//  HomeView.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 25.04.2023.
//

import SwiftUI

enum PartListType {
    case body
    case muscle
    
    var linkForCategory: String {
        switch self {
        case.body:
            return "https://exercisedb.p.rapidapi.com/exercises/bodyPart/"
        case.muscle:
            return "https://exercisedb.p.rapidapi.com/exercises/target/"
        }
    }
    
    var partsArray: [String] {
        switch self {
        case .body:
            return [
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
        case .muscle:
            return [
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
        }
    }
}

struct HomeView: View {
    @State private var selectedTab: CustomTab = .home
    @State private var isBodyCell = true
    let colorBackground = #colorLiteral(red: 0.368512094, green: 0.1596673727, blue: 0.4955242872, alpha: 1)

    var body: some View {
        NavigationView {
            ZStack {
                Color(colorBackground)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    BodyMusclesTogle(isBodyCell: $isBodyCell)
                    Spacer(minLength: 18)
                    PartList(partsArray: isBodyCell ? PartListType.body.partsArray : PartListType.muscle.partsArray,
                             linkForCategory: isBodyCell ? PartListType.body.linkForCategory : PartListType.muscle.linkForCategory)
                    .animation(nil)
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
