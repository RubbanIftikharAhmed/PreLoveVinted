//
//  ContentView.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 14/04/2025.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel()
    var body: some View {
        Group {
            if vm.userSession != nil {
                TabBarView()
                //ThreadsTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
