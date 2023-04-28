//
//  PartList.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 26.04.2023.
//

import SwiftUI

struct PartList: View {
    
    var partsArray: [String]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 18) {
                ForEach(partsArray, id: \.self) { part in
                    CellWithButton(text: part)
                }
                Spacer().frame(height: 0)
            }
        }
    }
}


struct PartList_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

