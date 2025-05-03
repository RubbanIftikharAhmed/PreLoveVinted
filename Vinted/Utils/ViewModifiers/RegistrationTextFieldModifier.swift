//
//  RegistrationTextFieldModifier.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 14/04/2025.
//

import Foundation
import SwiftUI

struct RegistrationTextFieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(.all, 12)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 20)
    }
}
