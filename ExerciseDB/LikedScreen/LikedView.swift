//
//  LikedView.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 25.04.2023.
//

import SwiftUI

struct LikedView: View {
    @State private var selectedTab: CustomTab = .liked
    let colorBackground = #colorLiteral(red: 0.368512094, green: 0.1596673727, blue: 0.4955242872, alpha: 1)
    var likedExerciseIdArray = FavoritesManager.shared.getFavorites()
    
    @State private var exercises: [Exercise] = []
    
    
    var body: some View {
        ZStack {
            Color(colorBackground)
                .edgesIgnoringSafeArea(.all)
            
            Group {
                if likedExerciseIdArray.isEmpty {
                    Text("No favorite exercises")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                } else {
                    
                    ScrollView{
                        Spacer(minLength: 18)
                        LazyVStack(spacing: 18) {
                            ForEach(exercises, id: \.self) { exercise in
                                ExerciseCell(isLiked: true,
                                             urlGif: exercise.gifUrl,
                                             name: exercise.name,
                                             bodyPart: exercise.bodyPart,
                                             target: exercise.target,
                                             equipment: exercise.equipment,
                                             id: exercise.id
                                )
                            }
                            Spacer().frame(height: 0)
                        }
                    }
                    .frame(maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.bottom)
                }
                
            }
            .onAppear{
                WebService.shared.fetchExercises(withIds: likedExerciseIdArray) { result in
                    switch result {
                    case .success(let exercises):
                        self.exercises = exercises
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}

struct LikedView_Previews: PreviewProvider {
    static var previews: some View {
        LikedView()
    }
}

