//
//  SearchScreen.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 21.04.2023.
//

import SwiftUI

struct SearchScreen: View {
    
    @State private var selectedTab: CustomTab = .search
    @State private var exercises = [Exercise]()
    @State private var filteredExercises = [Exercise]()
    @State private var isLoading = true
    @State private var searchText = ""
    
    let userDefaultsManager = FavoritesManager.shared
    
    var body: some View {
        
        ZStack {
            
            Color(UIColor.mainBackgroundColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                
                SearchBar(text: $searchText)
                
                ScrollView{
                    
                    Spacer(minLength: 18)
                    
                    LazyVStack(spacing: 18) {
                        
                        ForEach(filteredExercises, id: \.self) { exercise in
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
                .onAppear(perform: loadAllExercise)
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
        .onChange(of: searchText) { searchText in
            filteredExercises = filterExercises(exercises, searchText: searchText)
        }
    }
    
    func loadAllExercise() {
        isLoading = true
        let urlString = "https://exercisedb.p.rapidapi.com/exercises"
        WebService.shared.fetchData(fromURL: urlString) { (result: Result<[Exercise], Error>) in

            switch result {
            case .success(let exercises):
                DispatchQueue.main.async {
                    self.exercises = exercises
                    self.filteredExercises = self.filterExercises(exercises, searchText: self.searchText)
                    isLoading = false
                }
            case .failure(let error):
                print(error.localizedDescription)
                isLoading = false
            }
        }
    }
    
    func filterExercises(_ exercises: [Exercise], searchText: String) -> [Exercise] {
        if searchText.isEmpty {
            return exercises
        } else {
            return exercises.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
