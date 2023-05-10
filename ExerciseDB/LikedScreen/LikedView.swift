//
//  LikedView.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 25.04.2023.
//

import SwiftUI

struct LikedView: View {
    @State private var selectedTab: CustomTab = .liked
    @State private var exercises: [Exercise] = []
    @State private var isLoading = false
    
    var likedExerciseIdArray = FavoritesManager.shared.getFavorites()
    
    var body: some View {
        ZStack {
            
            Color(UIColor.mainBackgroundColor)
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
                                             exercise: exercise
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
                isLoading = true
                WebService.shared.fetchExercises(withIds: likedExerciseIdArray) { result in
                    switch result {
                    case .success(let exercises):
                        self.exercises = exercises
                    case .failure(let error):
                        print(error)
                    }
                    isLoading = false
                }
            }
            .overlay(
                
                Group {
                    if isLoading {
                        ProgressView("Loading...")
                            .frame(width: 120, height: 120)
                            .background(Color(UIColor.secondarySystemBackground))
                            .foregroundColor(.primary)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                    }
                }
            )
        }
    }
}


struct LikedView_Previews: PreviewProvider {
    static var previews: some View {
        LikedView()
    }
}

