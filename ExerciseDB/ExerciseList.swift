//
//  ExerciseList.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 27.04.2023.
//

import SwiftUI

struct ExerciseList: View {
    //    @State private var exercise: [Exercise] = []
    @State private var exercise = [
        Exercise(bodyPart:"waist",
                 equipment:"body weight",
                 gifUrl:"http://d205bpvrqc9yn1.cloudfront.net/0001.gif",
                 id:"0001",
                 name:"3/4 sit-up",
                 target:"abs"),
        Exercise(bodyPart:"waist",
                 equipment:"body weight",
                 gifUrl:"http://d205bpvrqc9yn1.cloudfront.net/0002.gif",
                 id:"0002",
                 name:"45° side bend",
                 target:"abs"),
        Exercise(bodyPart:"chest",
                 equipment:"barbell",
                 gifUrl:"http://d205bpvrqc9yn1.cloudfront.net/0050.gif",
                 id:"0050",
                 name:"barbell incline shoulder raise",
                 target:"serratus anterior"),
        Exercise(bodyPart:"chest",
                 equipment:"cable",
                 gifUrl:"http://d205bpvrqc9yn1.cloudfront.net/0191.gif",
                 id:"0191",
                 name:"cable one arm lateral bent-over",
                 target:"pectorals"),
        Exercise(bodyPart:"2hest",
                 equipment:"cable",
                 gifUrl:"http://d205bpvrqc9yn1.cloudfront.net/0191.gif",
                 id:"0191",
                 name:"cable one arm lateral bent-over",
                 target:"pectorals"),
        Exercise(bodyPart:"1hest",
                 equipment:"cable",
                 gifUrl:"http://d205bpvrqc9yn1.cloudfront.net/0191.gif",
                 id:"0191",
                 name:"cable one arm lateral bent-over",
                 target:"pectorals"),
        Exercise(bodyPart:"4hest",
                 equipment:"cable",
                 gifUrl:"http://d205bpvrqc9yn1.cloudfront.net/0191.gif",
                 id:"0191",
                 name:"cable one arm lateral bent-over",
                 target:"pectorals"),
    ]
    @State private var showErrorAlert = false
    @State private var errorMessage = "Bad URL"
    
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
                //                            .onAppear(perform: fetchData)
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
        WebService.shared.fetchData(fromURL: linkForCategory ) { (result: Result<[Exercise], Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let exercises):
                    self.exercise = exercises
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.showErrorAlert = true
                }
            }
        }
    }
}

struct ExerciseList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
