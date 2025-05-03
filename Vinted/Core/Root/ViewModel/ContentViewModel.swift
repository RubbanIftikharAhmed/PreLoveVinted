//
//  ContentViewModel.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 14/04/2025.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth

class ContentViewModel : ObservableObject{
    @Published var userSession : FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
