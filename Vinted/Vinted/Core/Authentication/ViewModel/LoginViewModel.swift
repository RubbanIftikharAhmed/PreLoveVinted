//
//  LoginViewModel.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 16/04/2025.
//

import Foundation
class LoginViewModel : ObservableObject{
    
    @Published var email: String = ""
    @Published var password: String = ""

    @MainActor
    func loginUser() async throws {
        do{
            try await AuthService.shared.login(email: email, password: password)
        } catch {
            
        }
    }
}
