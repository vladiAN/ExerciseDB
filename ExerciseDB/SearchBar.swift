//
//  SearchBar.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 05.05.2023.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        
        HStack {
            
            TextField("Search...", text: $text)
                .frame(width: 320, height: 48)
                .padding(.horizontal, 16)
                .background(Color.white)
                .cornerRadius(31)
        }
    }
}

func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}



