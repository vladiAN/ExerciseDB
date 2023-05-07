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
    let colorBackground = #colorLiteral(red: 0.368512094, green: 0.1596673727, blue: 0.4955242872, alpha: 1)
    let userDefaultsManager = FavoritesManager.shared
    
    
    
    var body: some View {
        
        ZStack {
            Color(colorBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                SearchBar(text: $searchText)
                
                ScrollView{
                    Spacer(minLength: 18)
                    LazyVStack(spacing: 18) {
                        ForEach(filteredExercises, id: \.self) { exercise in
                            ExerciseCell(
                                isLiked: userDefaultsManager.isContainsExercise(idExercise: exercise.id),
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
                .onAppear(perform: loadAllExercise)
            }
        }
        .onChange(of: searchText) { searchText in
            filteredExercises = filterExercises(exercises, searchText: searchText)
        }
    }
    
    func loadAllExercise() {
        let urlString = "https://exercisedb.p.rapidapi.com/exercises"
        WebService.shared.fetchData(fromURL: urlString) { (result: Result<[Exercise], Error>) in
            switch result {
            case .success(let exercises):
                DispatchQueue.main.async {
                    self.exercises = exercises
                    self.filteredExercises = self.filterExercises(exercises, searchText: self.searchText)
                }
            case .failure(let error):
                print(error.localizedDescription)
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
