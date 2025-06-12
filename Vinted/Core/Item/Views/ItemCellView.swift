//
//  FeedCellView.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 28/03/2025.
//

import SwiftUI

struct ItemCellView: View {
    @EnvironmentObject var vm : ItemViewModel
    let item: ItemModel

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomTrailing) {
                Image("jeans")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Button {
                    //
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "heart")
                            .font(.system(size: 18))
                        
                        Text("\(item.favourites)")
                            .font(.system(size: 14))
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.9))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 2)
                }
                .padding(07)
            }
            .padding(.bottom, 04)

            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("XXL · \(item.condition.rawValue)")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                Text("PKR \(String(format: "%.0f", item.price))")
                    .font(.subheadline)
            }
            .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    ItemCellView(item:  ItemModel(name: "Carhartt", isSold: false, condition: .good, price: 2300, brand: "Carhartt", favourites: 0, views: 0, category: .men, images: []))
        .environmentObject(ItemViewModel())
}
