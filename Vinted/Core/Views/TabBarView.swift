//
//  TabBarView.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 22/03/2025.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var itemVM : ItemViewModel
    @State private var selectedTab = 0
    @State private var previousTab = 0
    @State private var showUploadItemSheet : Bool = false
    
    var body: some View {
        TabView(selection: $selectedTab){
            FeedView()
                .tag(0)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Search")
                .tag(1)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            Color.clear
                .tag(2)
                .tabItem {
                    Label("Upload", systemImage: "plus.circle")
                }
            
            Text("Messages")
                .tag(3)
                .tabItem {
                    Label("Messages", systemImage: "envelope")
                }
            
            Text("Profile")
                .tag(4)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .onChange(of: selectedTab) { oldValue, newValue in
            if newValue == 2{
                previousTab = oldValue
                //previousTab = selectedTab == 2 ? 0 : selectedTab
                showUploadItemSheet = true
                selectedTab = previousTab
            }
        }
        .fullScreenCover(isPresented: $showUploadItemSheet) {
            NavigationStack{
                UploadItemView()
                    .toolbar{
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                showUploadItemSheet = false
                            } label: {
                                Text("Cancel")
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(ItemViewModel())
}
