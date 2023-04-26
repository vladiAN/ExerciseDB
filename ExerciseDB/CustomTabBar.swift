//
//  CustomTabBar.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 24.04.2023.
//

import SwiftUI

enum CustomTab {
    case search
    case home
    case liked
}

struct CustomTabBar: View {
    @Binding var selectedTab: CustomTab
    
    let colorTabBar = #colorLiteral(red: 0.08156744391, green: 0.03490324691, blue: 0.1350616217, alpha: 1)
    
    var body: some View {
        ZStack {
            Color(colorTabBar)
                .frame(width: UIScreen.main.bounds.width, height: 114)
                .cornerRadius(24, corners: [.topLeft, .topRight])
                .cornerRadius(0, corners: [.bottomLeft, .bottomRight])
            HStack {
                Button(action: {
                    selectedTab = .search
                }) {
                    VStack{
                        Image(uiImage: selectedTab == .search ? UIImage(named: "searchSelected")! : UIImage(named: "search")!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .padding(.bottom, 3)
                        Text("Search")
                            .font(Font.custom("Gotham Pro", size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(selectedTab == .search ? .white : .gray)
                    }
                }
                Spacer()
                Button(action: {
                    selectedTab = .home
                }) {
                    VStack {
                        Image(uiImage: selectedTab == .home ? UIImage(named: "homeSelected")! : UIImage(named: "home")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.bottom, 3)
                        Text("Home")
                            .font(Font.custom("Gotham Pro", size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(selectedTab == .home ? .white : .gray)
                    }
                }
                Spacer()
                Button(action: {
                    selectedTab = .liked
                }) {
                    VStack {
                        Image(uiImage: selectedTab == .liked ? UIImage(named: "likedSelected")! : UIImage(named: "liked")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.bottom, 3)
                        Text("Liked")
                            .font(Font.custom("Gotham Pro", size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(selectedTab == .liked ? .white : .gray)
                    }
                }
            }
            .padding(EdgeInsets(top: 16, leading: 55, bottom: 16, trailing: 55))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
