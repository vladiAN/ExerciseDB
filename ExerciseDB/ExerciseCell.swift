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
    let urlGif: String
    let name: String
    let bodyPart: String
    let target: String
    let equipment: String
    let id: String
    
    var userDefaultsManager = FavoritesManager.shared
    
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
                            
                            GIFView(url: URL(string: urlGif)!)
                                .frame(width: 246, height: 246)
                                .onTapGesture {
                                    self.isDetail.toggle()
                                }
                            
                            Rectangle()
                                .frame(width: 350, height: 2)
                                .foregroundColor(Color.black)
                            
                            HStack {
                                
                                VStack {
                                    
                                    Text(name.prefix(1).uppercased() + name.dropFirst())
                                        .font(Font.custom("Gotham Pro", size: 19))
                                        .lineLimit(1)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .minimumScaleFactor(0.5)
                                        .padding(.leading, 18)
                                        .padding(.bottom, 1)

                                                                        
                                    Text("Equipment: " + equipment.prefix(1).uppercased() + equipment.dropFirst())
                                        .font(Font.custom("Gotham Pro", size: 11))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 18)
                                        .padding(.bottom, 1)
                                    
                                    HStack {
                                        
                                        Text(bodyPart.prefix(1).uppercased() + bodyPart.dropFirst())
                                            .font(Font.custom("Gotham Pro", size: 11))
                                            .underline()
                                            .foregroundColor(.red)
                                        
                                        
                                        Text(target.prefix(1).uppercased() + target.dropFirst())
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
                                        self.userDefaultsManager.addLikedExercise(idExercise: self.id)
                                    } else {
                                        self.userDefaultsManager.removeLikedExercise(idExercise: self.id)
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
                            
                            if let gifURL = URL(string: urlGif) {
                                UIImage.firstFrame(gif: urlGif) { image in
                                    if let image = image  {
                                        Group {
                                            Image(uiImage: image)
                                                .resizable()
                                                .frame(width: 80, height: 80)
                                                .scaledToFit()
                                                .onTapGesture {
                                                    self.isDetail.toggle()
                                                }
                                        }
                                    }
                                    else {
                                        Text("No image")
                                    }
                                }
                                
                            } else {
                                Text("Error url gif")
                            }
                            
                            Rectangle()
                                .frame(width: 3, height: 78)
                                .foregroundColor(Color.black)
                            
                            VStack(alignment: .leading) {
                                
                                Text(name.prefix(1).uppercased() + name.dropFirst())
                                    .font(Font.custom("Gotham Pro", size: 19))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                
                                HStack {
                                    
                                    Text(bodyPart.prefix(1).uppercased() + bodyPart.dropFirst())
                                        .font(Font.custom("Gotham Pro", size: 11))
                                        .underline()
                                        .foregroundColor(.red)
                                    
                                    
                                    Text(target.prefix(1).uppercased() + target.dropFirst())
                                        .font(Font.custom("Gotham Pro", size: 11))
                                        .underline()
                                        .foregroundColor(.red)
                                    
                                }
                                .offset(y: 3)
                                
                                
                                Text("Equipment: " + equipment.prefix(1).uppercased() + equipment.dropFirst())
                                    .font(Font.custom("Gotham Pro", size: 11))
                                    .offset(y: 6)
                                
                            }
                            .padding(.leading, 13)
                            Spacer()
                            
                            Button(action: {
                                self.isLiked.toggle()
                                if self.isLiked {
                                    self.userDefaultsManager.addLikedExercise(idExercise: self.id)
                                } else {
                                    self.userDefaultsManager.removeLikedExercise(idExercise: self.id)
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

