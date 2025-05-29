//
//  TestFileView.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 05/05/2025.
//

import SwiftUI
import PhotosUI

struct UploadPhotosView: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var images: [UIImage] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Add up to 20 photos.").font(.subheadline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Array(images.enumerated()), id: \.offset) { index, image in
                        ZStack(alignment: .topTrailing) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipped()
                                .cornerRadius(8)
                            
                            Button(action: {
                                images.remove(at: index)
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                                    .background(Color.black.opacity(0.6))
                                    .clipShape(Circle())
                            }
                            .offset(x: 5, y: -5)
                        }
                    }
                    
                    PhotosPicker(
                        selection: $selectedItems,
                        maxSelectionCount: 8,
                        matching: .images
                    ) {
                        VStack {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.blue)
                        }
                        .frame(width: 80, height: 80)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.4))
                        )
                    }
                    .onChange(of: selectedItems) { _ in
                        Task {
                            await loadImages()
                        }
                    }
                }
                .padding(.vertical)
            }
            
            Text("Click and drag to rearrange").font(.caption).foregroundColor(.gray)
        }
        .padding()
    }

    private func loadImages() async {
        for item in selectedItems {
            if let data = try? await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                images.append(uiImage)
            }
        }
        selectedItems.removeAll()
    }
}

#Preview {
    UploadPhotosView()
        .environmentObject(ItemViewModel())
}
