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
    var body: some View {
        NavigationStack{
            VStack{
                PhotosPicker(
                    selection: $photosPickerItem,
                    maxSelectionCount: 8,
                    matching: .any(of: [.images, .not(.screenshots)])) {
                        HStack{
                            ScrollView{
                                if photosPickerItem.isEmpty {
                                    Text("Upload Images")
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 200)
                                        .background(Color.gray.opacity(0.1))
                                        .clipShape(RoundedRectangle(cornerRadius: 6))
                                        .padding(.horizontal, 10)
                                } else {
                                    HStack{
                                        
                                    }
                                }
                            }
                        }
                }
            }
            .navigationTitle("Sell an item")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: photosPickerItem) { _, newItems in
                loadImages(from: newItems)
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
