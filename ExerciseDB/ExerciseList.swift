//
//  ExerciseList.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 27.04.2023.
//

import SwiftUI

struct ExerciseList: View {
    @State private var exercise: [Exercise] = []
    @State private var showErrorAlert = false
    @State private var errorMessage = "Bad URL"
    @State private var isLoading = false
    
    var navigationTitle: String
    var linkForCategory: String
    var userDefaultsManager = FavoritesManager.shared
    
    let colorBackground = #colorLiteral(red: 0.368512094, green: 0.1596673727, blue: 0.4955242872, alpha: 1)
    
    var body: some View {
        
        ZStack {
            
            Color(colorBackground)
                .edgesIgnoringSafeArea(.all)
            if #available(iOS 16.0, *) {
                
                ScrollView{
                    
                    Spacer(minLength: 18)
                    
                    LazyVStack(spacing: 18) {
                        
                        ForEach(exercise, id: \.self) { exercise in
                            ExerciseCell(
                                isLiked: userDefaultsManager.isContainsExercise(idExercise: exercise.id),
                                exercise: exercise
                            )
                        }
                        Spacer().frame(height: 0)
                    }
                }
                .frame(maxHeight: .infinity)
                .edgesIgnoringSafeArea(.bottom)
                .onAppear(perform: fetchData)
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
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
                .toolbarBackground(.visible, for: .navigationBar)
                .navigationBarTitle(navigationTitle, displayMode: .automatic)
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    func fetchData() {
        isLoading = true
        WebService.shared.fetchData(fromURL: linkForCategory ) { (result: Result<[Exercise], Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let exercises):
                    self.exercise = exercises
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.showErrorAlert = true
                }
                isLoading = false
            }
        }
    }
}

struct ExerciseList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
