//
//  BodyMusclesTogle.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 26.04.2023.
//

import SwiftUI

struct BodyMusclesTogle: View {
    
    @Binding var isBodyCell: Bool
        
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 260, height: 59)
                .foregroundColor(.white)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 114, height: 42)
                .foregroundColor(Color(UIColor.buttonTogleColor))
                .offset(x: isBodyCell ? -59 : 59)
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.isBodyCell = true
                }
            }) {
                Text("Body")
                    .font(Font.custom("Gotham Pro", size: 16))
                    .foregroundColor(isBodyCell ? Color.white : Color.black)
            }
            .offset(x: -59)
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.isBodyCell = false
                }
            }) {
                Text("Muscles")
                    .font(Font.custom("Gotham Pro", size: 16))
                    .foregroundColor(isBodyCell ? Color.black : Color.white)
            }
            .offset(x: 59)
        }
    }
}

struct BodyMusclesTogle_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
