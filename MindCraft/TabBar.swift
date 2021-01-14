//
//  TabBar.swift
//  MindCraft
//
//  Created by Anshul Garg on 22/11/20.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "square.grid.3x3.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("primary"))
                    Text("Home")
                }.accentColor(Color("primary"))
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("primary"))
                    Text("Profile")
                }.accentColor(Color("primary"))
            
            FeedView()
                .tabItem {
                    Image(systemName: "rectangle.stack")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("primary"))
                    Text("Feed")
                }.accentColor(Color("primary"))
        }.accentColor(Color("primary"))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
