//
//  CellWithButton.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 27.04.2023.
//

import SwiftUI

struct CellWithButton: View {
    
    @State private var isShowingDetails = false
    
    var categotyName: String {
        didSet {
            categotyName = categotyName.capitalized
            print(categotyName)
        }
    }
    
    let linkForCategory: String
    
    var body: some View {
        
        Rectangle()
            .frame(width: 350, height: 69)
            .foregroundColor(Color.white)
            .overlay(
                
                HStack {
                    
                    Text(categotyName)
                        .padding(.leading, 26)
                    
                    Spacer()
                    
                    NavigationLink(destination: ExerciseList(navigationTitle: categotyName, linkForCategory: linkForCategory)) {
                        
                        Image(uiImage: UIImage(named: "buttonCell")!)
                            .resizable()
                            .frame(width: 45, height: 45)
                            .foregroundColor(.red)
                        
                    }
                    
                    .buttonStyle(PlainButtonStyle())
                    .padding(.trailing, 21)
                }
            )
            .cornerRadius(10)
    }
}



