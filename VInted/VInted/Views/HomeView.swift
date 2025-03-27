//
//  HomeView.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 27/03/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm : itemViewModel
    @State var searchText : String = ""
    var body: some View {
        VStack(spacing: 20){
            Textfield

            VStack(alignment: .leading) {
                Text("Personalize your Feed")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("Follow the brands you love to find items that match your style.")
                    .foregroundStyle(Color.white)
                
                Button {
                    
                } label: {
                    Text("Personalize")
                        .foregroundStyle(Color(hex : "#006600"))
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 02))
                        .padding(.horizontal, 0)
                    
                }
            }
            .padding(.all ,10)
            .background(Color(hex: "#006600"))
            Spacer()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(itemViewModel())
}


extension HomeView {
    var Textfield : some View{
        TextField("Search for clothing articles", text: $searchText)
            .padding(.vertical, 20)
            .padding(.leading, 15)
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 08)
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let r, g, b: Double
        if hex.count == 6 { // RGB Format (without Alpha)
            r = Double((int >> 16) & 0xFF) / 255.0
            g = Double((int >> 8) & 0xFF) / 255.0
            b = Double(int & 0xFF) / 255.0
            self.init(red: r, green: g, blue: b)
        } else {
            self.init(.black) // Default to black if invalid hex
        }
    }
}
