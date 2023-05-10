//
//  ExerciseCell.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 28.04.2023.
//

import SwiftUI
import URLImage

struct ExerciseCell: View {
    @State private var isDetail = false
    @State var isLiked: Bool
    
    var userDefaultsManager = FavoritesManager.shared
    
    let exercise: Exercise
    
    var body: some View {
        
        Rectangle()
            .frame(width: 350, height: isDetail ? 350 : 78)
            .foregroundColor(Color.white)
            .onTapGesture {
                self.isDetail.toggle()
            }
            .overlay(
                
                Group {
                    
                    if isDetail {
                        
                        VStack {
                            
                            GIFView(url: URL(string: exercise.gifUrl)!)
                                .frame(width: 246, height: 246)
                                .onTapGesture {
                                    self.isDetail.toggle()
                                }
                            
                            Rectangle()
                                .frame(width: 350, height: 2)
                                .foregroundColor(Color.black)
                            
                            HStack {
                                
                                VStack {
                                    
                                    Text(exercise.name.prefix(1).uppercased() + exercise.name.dropFirst())
                                        .font(Font.custom("Gotham Pro", size: 19))
                                        .lineLimit(1)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .minimumScaleFactor(0.5)
                                        .padding(.leading, 18)
                                        .padding(.bottom, 1)
                                    
                                    
                                    Text("Equipment: " + exercise.equipment.prefix(1).uppercased() + exercise.equipment.dropFirst())
                                        .font(Font.custom("Gotham Pro", size: 11))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 18)
                                        .padding(.bottom, 1)
                                    
                                    HStack {
                                        
                                        Text(exercise.bodyPart.prefix(1).uppercased() + exercise.bodyPart.dropFirst())
                                            .font(Font.custom("Gotham Pro", size: 11))
                                            .underline()
                                            .foregroundColor(.red)
                                        
                                        
                                        Text(exercise.target.prefix(1).uppercased() + exercise.target.dropFirst())
                                            .font(Font.custom("Gotham Pro", size: 11))
                                            .underline()
                                            .foregroundColor(.red)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 18)
                                    
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    self.isLiked.toggle()
                                    if self.isLiked {
                                        self.userDefaultsManager.addLikedExercise(idExercise: self.exercise.id)
                                    } else {
                                        self.userDefaultsManager.removeLikedExercise(idExercise: exercise.id)
                                    }
                                }) {
                                    Image(uiImage: isLiked ? UIImage(named: "likedCell")! : UIImage(named: "noLiked")!)
                                        .resizable()
                                        .frame(width: 27, height: 27)
                                        .foregroundColor(.red)
                                }
                                .padding(.trailing, 18)
                            }
                            
                        }
                        
                    } else {
                        
                        HStack(spacing: 0) {
                            
                            if let gifURL = URL(string: exercise.gifUrl),
                               let image = UIImage.firstFrame(gif: gifURL) {
                                Group {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .scaledToFit()
                                        .onTapGesture {
                                            self.isDetail.toggle()
                                        }
                                }
                            } else {
                                Text("No image")
                            }
                            
                            
                            Rectangle()
                                .frame(width: 3, height: 78)
                                .foregroundColor(Color.black)
                            
                            VStack(alignment: .leading) {
                                
                                Text(exercise.name.prefix(1).uppercased() + exercise.name.dropFirst())
                                    .font(Font.custom("Gotham Pro", size: 19))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                
                                HStack {
                                    
                                    Text(exercise.bodyPart.prefix(1).uppercased() + exercise.bodyPart.dropFirst())
                                        .font(Font.custom("Gotham Pro", size: 11))
                                        .underline()
                                        .foregroundColor(.red)
                                    
                                    
                                    Text(exercise.target.prefix(1).uppercased() + exercise.target.dropFirst())
                                        .font(Font.custom("Gotham Pro", size: 11))
                                        .underline()
                                        .foregroundColor(.red)
                                    
                                }
                                .offset(y: 3)
                                
                                
                                Text("Equipment: " + exercise.equipment.prefix(1).uppercased() + exercise.equipment.dropFirst())
                                    .font(Font.custom("Gotham Pro", size: 11))
                                    .offset(y: 6)
                                
                            }
                            .padding(.leading, 13)
                            
                            Spacer()
                            
                            Button(action: {
                                self.isLiked.toggle()
                                if self.isLiked {
                                    self.userDefaultsManager.addLikedExercise(idExercise: exercise.id)
                                } else {
                                    self.userDefaultsManager.removeLikedExercise(idExercise: exercise.id)
                                }
                                print(userDefaultsManager.getFavorites())
                            }) {
                                Image(uiImage: isLiked ? UIImage(named: "likedCell")! : UIImage(named: "noLiked")!)
                                    .resizable()
                                    .frame(width: 27, height: 27)
                                    .foregroundColor(.red)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.trailing, 21)
                    }
                }
            )
            .cornerRadius(10)
    }
    
}

struct Exercise_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseList(navigationTitle: "Test", linkForCategory: "")
    }
}

