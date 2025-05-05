//
//  UploadItemView.swift
//  
//
//  Created by Rubban Iftikhar on 19/04/2025.
//

import SwiftUI

//yet to implement sizing techniques here
struct UploadItemView: View {
    @EnvironmentObject var vm : ItemViewModel
    var body: some View {
        NavigationStack{
            VStack{
                
            }
            .navigationTitle("Sell an item")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    UploadItemView()
        .environmentObject(ItemViewModel())
}
