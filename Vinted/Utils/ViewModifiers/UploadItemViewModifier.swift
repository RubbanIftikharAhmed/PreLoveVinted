//
//  UploadItemViewModifier.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 04/06/2025.
//

import Foundation
import SwiftUI

struct UploadItemViewModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .padding(.horizontal, 5)
            .background(Color(UIColor.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .padding(.horizontal, 10)
    }
}
