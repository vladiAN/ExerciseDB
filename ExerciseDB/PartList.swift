//
//  PartList.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 26.04.2023.
//

import SwiftUI

struct PartList: View {
    
    var partsArray: [String]
    var linkForCategory: String
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 18) {
                ForEach(partsArray, id: \.self) { part in
                    let partWithoutSpaser = part.replacingOccurrences(of: " ", with: "%20")
                    let linkForCategory = self.linkForCategory + partWithoutSpaser
                    let partCapitalized = part.capitalized
                    CellWithButton(categotyName: partCapitalized, linkForCategory: linkForCategory)
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

