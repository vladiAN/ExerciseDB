//
//  SearchView.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 21.04.2023.
//

import SwiftUI

struct SearchView: View {
    @State private var exercises: [Exercise] = []
    @State private var showErrorAlert = false
    @State private var errorMessage = ""
    @State private var selectedTab: CustomTab = .search

    var body: some View {
 
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)

            Text("SearchView")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
        
//        VStack(spacing: 0) {
//            List(exercises, id: \.id) { exercise in
//                VStack(alignment: .leading) {
//                    Text("Name: \(exercise.name)")
//                    Text("Body Part: \(exercise.bodyPart)")
//                    Text("Target: \(exercise.target)")
//                }
//            }
//            
//            .listStyle(PlainListStyle())
//            
//
//            CustomTabBar(selectedTab: $selectedTab)
//                .disabled(true)
//            
//        }
//        .frame(maxHeight: .infinity)
//        .edgesIgnoringSafeArea(.bottom)
//        .onAppear(perform: fetchData)
//        .alert(isPresented: $showErrorAlert) {
//            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//        }
    }

//    func fetchData() {
//        let webservice = Webservice()
//        webservice.fetchData(fromURL: "https://exercisedb.p.rapidapi.com/exercises") { (result: Result<[Exercise], Error>) in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let exercises):
//                    self.exercises = exercises
//                case .failure(let error):
//                    self.errorMessage = error.localizedDescription
//                    self.showErrorAlert = true
//                }
//            }
//        }
//    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
