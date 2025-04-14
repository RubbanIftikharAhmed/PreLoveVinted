//
//  AuthService.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 14/04/2025.
//

import Firebase
import FirebaseAuth

class AuthService{
    @Published var userSession : FirebaseAuth.User? // to keep track if the user is logged in or not
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser //whether the user is logged in or not
    }
    @MainActor
    func login(email: String, password: String) async throws {
        
    }
    
    @MainActor
    func createUser(fullname: String, userName: String, email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: created user with uuid \(result.user.uid)")
        } catch let error {
            print("DEBUG error creating user \(error.localizedDescription)")
        }
    }
}

