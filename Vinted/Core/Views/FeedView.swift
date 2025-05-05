//
//  HomeView.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 27/03/2025.
//

import SwiftUI
struct FeedView: View {
    @EnvironmentObject var vm : ItemViewModel
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Textfield
                ScrollView {
                    VStack(alignment: .leading) {
                        PersonalizeYourFeed
                            .padding(.vertical, 20)
                    }
                    .padding(.all, 15)
                    .background(Color.green)
                    .padding(.horizontal, 8)
                    
                    VStack{
                        HStack {
                            Text("Popular items")
                                .fontWeight(.semibold)
                            Spacer()
                            
                            NavigationLink {
                                Text("View all items")
                            } label: {
                                Text("View all")
                            }
                        }
                        .padding(.horizontal, 8)
                        
                        ScrollView {
                            HStack{
                                ForEach(vm.items) { item in
                                    ItemCellView(item: item)
                                }
                            }
                        }
                    }

                }
                .refreshable {
                    Task {
                        //await vm.fetchItems()
                    }
                }
                .task {
                    // Load items when view appears
                    //await vm.fetchItems()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    FeedView()
        .environmentObject(ItemViewModel())
}


extension FeedView {
    var Textfield : some View{
        TextField("Search for clothing articles", text: $vm.searchText)
            .padding(.vertical, 20)
            .padding(.leading, 15)
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 8)
    }
    
    
    
    var PersonalizeYourFeed : some View {
        VStack(alignment: .leading){
            Text("Personalize your Feed")
                .foregroundStyle(Color.white)
                .font(.title3)
                .fontWeight(.semibold)
            Text("Follow the brands you love to find items that match your style.")
                .foregroundStyle(Color.white)
            
            Button {
                
            } label: {
                Text("Personalize")
                    .foregroundStyle(Color.green)
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    .padding(.horizontal, 0)
                
            }
        }
    }
}


//extension Color {
//    init(hex: String) {
//        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
//        var int: UInt64 = 0
//        Scanner(string: hex).scanHexInt64(&int)
//        
//        let r, g, b: Double
//        if hex.count == 6 { // RGB Format (without Alpha)
//            r = Double((int >> 16) & 0xFF) / 255.0
//            g = Double((int >> 8) & 0xFF) / 255.0
//            b = Double(int & 0xFF) / 255.0
//            self.init(red: r, green: g, blue: b)
//        } else {
//            self.init(.black) // Default to black if invalid hex
//        }
//    }
//}
