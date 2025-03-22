//
//  TabBarView.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 22/03/2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            Text("Home")
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            
            Text("Search")
                .tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            
            Text("Upload")
                .tabItem {
                    VStack{
                        Image(systemName: "plus.circle")
                        Text("Upload")
                    }
                }
            
            Text("Messages")
                .tabItem {
                    VStack{
                        Image(systemName: "envelope")
                        Text("Messages")
                    }
                }
            
            Text("Profile")
                .tabItem {
                    VStack{
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }
        }
    }
}

#Preview {
    TabBarView()
}
