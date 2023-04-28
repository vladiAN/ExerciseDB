//
//  CellWithButton.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 27.04.2023.
//

import SwiftUI

struct CellWithButton: View {
    let text: String
    @State private var isShowingDetails = false
    
    var body: some View {
        
        Rectangle()
            .frame(width: 350, height: 69)
            .foregroundColor(Color.white)
            .overlay(
                HStack {
                    Text(text)
                        .padding(.leading, 26)
                    Spacer()
                    NavigationLink(destination: ExerciseList(nameLink: text)) {
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



