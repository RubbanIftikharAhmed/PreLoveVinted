//
//  UploadItemView.swift
//  
//
//  Created by Rubban Iftikhar on 19/04/2025.
//

import SwiftUI
import PhotosUI


struct UploadItemView: View {
    @EnvironmentObject var vm : ItemViewModel
    @State private var photosPickerItem : [PhotosPickerItem] = []
    @State private var selectedImages : [UIImage] = []
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var price: String = ""
    var body: some View {
        NavigationStack{
            
            ScrollView {
                VStack(spacing: 10){
                    UploadImages
                        .padding(.bottom, 10)
                    
                    TextField("Add a title", text: $title)
                        .modifier(UploadItemViewModifier())
                    
                    TextField("Descibe the item you are selling", text: $description)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 50)
                        .padding(.horizontal, 5)
                        .background(Color(UIColor.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .padding(.horizontal, 10)
                    
                    
                    
                    VStack(spacing: 0){
                        NavigationLink {
                            ItemCatergories()
                        } label: {
                            HStack{
                                Text("Category")
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .fontWeight(.semibold)
                            }
                            .modifier(UploadItemViewModifier())
                        }
                        Divider()
                        
                        NavigationLink {
                            
                        } label: {
                            HStack{
                                Text("Brand")
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .fontWeight(.semibold)
                            }
                            .modifier(UploadItemViewModifier())
                        }
                        Divider()
                        
                        NavigationLink {
                            
                        } label: {
                            HStack{
                                Text("Size")
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .fontWeight(.bold)
                            }
                            .modifier(UploadItemViewModifier())
                        }
                        Divider()
                        
                        NavigationLink {
                            
                        } label: {
                            HStack{
                                Text("Measurements")
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .fontWeight(.bold)
                            }
                            .modifier(UploadItemViewModifier())
                        }
                        Divider()
                        
                        NavigationLink {
                            
                        } label: {
                            HStack{
                                Text("Color")
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .fontWeight(.bold)
                            }
                            .modifier(UploadItemViewModifier())
                        }
                        
                        Divider()
                        
                        TextField("Price", text: $price)
                            .keyboardType(.numberPad)
                            .modifier(UploadItemViewModifier())
                    }

                    

                    

                    

                    



                    
                    
                    Spacer()
                }
                .navigationTitle("Sell an item")
                .navigationBarTitleDisplayMode(.inline)
                .onChange(of: photosPickerItem) { _, newItems in
                    loadImages(from: newItems)
                }
            }
        }
    }
    
    private func loadImages(from items : [PhotosPickerItem]){
        for item in items {
            item.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let data):
                    if let data = data, let uimage = UIImage(data: data){
                        DispatchQueue.main.async {
                            selectedImages.append(uimage)
                        }
                    }
                case .failure(let error):
                    print("DEBUG: error loading image \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    UploadItemView()
        .environmentObject(ItemViewModel())
}




extension UploadItemView{
    
    
    
    
    
    var UploadImages: some View{
        VStack{ //Upload images VStack
            PhotosPicker(
                selection: $photosPickerItem,
                maxSelectionCount: 8,
                matching: .images) {
                    if photosPickerItem.isEmpty {
                        Text("Upload Images")
                    } else {
                        ScrollView(.horizontal) {
                            LazyHStack{
                                ForEach(selectedImages.indices, id: \.self){ index in
                                    Image(uiImage: selectedImages[index])
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 150)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 5)
                                        .overlay(alignment: .topTrailing){
                                            Button{
                                                //remove image function
                                            }label: {
                                                Circle()
                                                    .fill(Color.red)
                                                    .frame(width: 20, height: 20)
                                                    .overlay{
                                                        Image(systemName: "xmark")
                                                            .font(.caption)
                                                            .foregroundStyle(Color.white)
                                                            .fontWeight(.bold)
                                                        
                                                    }
                                            }
                                        }
                                }
                            }
                        }
                    }
                }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .background(Color(UIColor.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .padding(.horizontal, 10)
    }
}
