//
//  SignUpView.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 14/04/2025.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var vm = RegistrationViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack{
            Spacer()
            ThreadsLogo
            InputFields
            SignUpButton
            Spacer()
            Divider()
            LoginDismiss
            
        }
    }
}

#Preview {
    SignUpView()
}
extension SignUpView{
    private var ThreadsLogo: some View{
        Image(systemName: "cart")
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 180)
    }
    
    
    private var InputFields: some View{
        VStack{
            TextField("Enter your email", text: $vm.email)
                .modifier(RegistrationTextFieldModifier())
            SecureField("Enter your password", text: $vm.password)
                .modifier(RegistrationTextFieldModifier())
            TextField("Enter your fullname", text: $vm.fullname)
                .modifier(RegistrationTextFieldModifier())
            TextField("Enter your username", text: $vm.username)
                .modifier(RegistrationTextFieldModifier())
        }
    }
    private var SignUpButton: some View{
        Button {
            Task {
                try await vm.createUser()
            }
        } label: {
            Text("Sign Up")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(Color.black)
                .cornerRadius(8)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
    
    private var LoginDismiss: some View{
        Button {
            dismiss()
        } label: {
            HStack(spacing: 3) {
                Text("Already have an account?")
                Text("Sign in")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
            .foregroundStyle(Color.black)
        }
        .padding(.vertical, 16)
    }
}

