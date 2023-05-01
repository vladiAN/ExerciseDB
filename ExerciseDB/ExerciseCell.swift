//
//  ExerciseCell.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 28.04.2023.
//

import SwiftUI
import URLImage

struct ExerciseCell: View {
    @State private var isLiked = false
    @State private var isDetail = false
    let urlGif: String
    let name: String
    let bodyPart: String
    let target: String
    let equipment: String
    
    
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
                            
                            Rectangle()
                                .frame(width: 350, height: 2)
                                .foregroundColor(Color.black)
                            
                            HStack {
                                
                                Text(name.prefix(1).uppercased() + name.dropFirst())
                                    .font(Font.custom("Gotham Pro", size: 19))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                
                                Spacer()
                                
                                Button(action: {
                                    self.isLiked.toggle()
                                }) {
                                    Image(uiImage: isLiked ? UIImage(named: "likedCell")! : UIImage(named: "noLiked")!)
                                        .resizable()
                                        .frame(width: 27, height: 27)
                                        .foregroundColor(.red)
                                }
                                
                            }
                            .padding(.trailing, 18)
                            .padding(.leading, 18)
                            .padding(.bottom, 16)
                            
                        }
                        
                    } else {
                        
                        HStack(spacing: 0) {
                            
                            if let gifURL = URL(string: urlGif), let firstFrame = UIKit.UIImage.firstFrame(gif: gifURL) {
                                Group {
                                    Image(uiImage: firstFrame)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .scaledToFit()
                                }
                            } else {
                                Text("No image")
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

                                    Text(target.prefix(1).uppercased() + target.dropFirst())
                                        .font(Font.custom("Gotham Pro", size: 11))

                                }
                                                        
                                Text("Equipment: " + equipment.prefix(1).uppercased() + equipment.dropFirst())
                                    .font(Font.custom("Gotham Pro", size: 11))
                                
                            }
                                .padding(.leading, 13)
                                .padding(.top, 12)
                                .padding(.bottom, 16)
                                .alignmentGuide(.leading, computeValue: { _ in 0 })
                            
                            Spacer()
                            
                            Button(action: {
                                self.isLiked.toggle()
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

struct ExerciseCell_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseList(categoryForLink: "ExerciseCell")
    }
}
