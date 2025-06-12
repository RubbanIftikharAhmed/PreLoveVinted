//
//  ItemCatergories.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 04/06/2025.
//

import SwiftUI

struct ItemCatergories: View {
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    NavigationLink {
                        MenCategoriesView()
                    } label: {
                        Text("\(categoriesEnum.men)")
                    }
                    
                    NavigationLink {
                        WomenCategoriesView()
                    } label: {
                        Text("\(categoriesEnum.women)")
                    }
                    
                    NavigationLink {
                        UnisexCategoriesView()
                    } label: {
                        Text("\(categoriesEnum.unisex)")
                    }
                    
                    NavigationLink {
                        ChildrenCategoriesView()
                    } label: {
                        Text("\(categoriesEnum.children)")
                    }

                }
            }
            .navigationTitle("Categories")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
//    private func destinationView(for categories: categoriesEnum) -> AnyView {
//        switch categories{
//        case .men:
//            MenCategoriesView()
//        case .women:
//            WomenCategoriesView()
//        case .children:
//            ChildrenCategoriesView()
//        case .unisex:
//            UnisexCategoriesView()
//        }
//    }
}

#Preview {
    ItemCatergories()
}
