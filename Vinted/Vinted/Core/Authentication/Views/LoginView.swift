//
//  LoginView.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 14/04/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        //since we wanna go back and forth between or login and sign up page. We need to use a navigation stack
        NavigationStack{
            VStack{
                Spacer()
                ThreadsLogo
                InputFields
                ForgotPasswordLink
                loginButton
                Spacer()
                Divider()
                SignUplink
            }
        }
    }
}

#Preview {
    LoginView()
}

extension LoginView{
    private var ThreadsLogo: some View{
        Image(systemName: "cart")
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 180)
    }
    
    
    private var InputFields: some View{
        VStack{
            TextField("Enter your email", text: $email)
                .modifier(RegistrationTextFieldModifier())
            SecureField("Enter your password", text: $password)
                .modifier(RegistrationTextFieldModifier())
        }
    }
    
    private var loginButton: some View{
        Button {
            
        } label: {
            Text("Login")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(Color.black)
                .cornerRadius(8)
        }
        .padding(.horizontal, 20)
    }
    
    
    private var ForgotPasswordLink: some View{
        NavigationLink {
            
        } label: {
            Text("Forgot password?")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(Color.black)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.vertical)
                .padding(.trailing, 20)
        }
    }
    
    private var SignUplink: some View{
        NavigationLink {
            SignUpView()
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack(spacing: 3) {
                Text("Dont have an account?")
                Text("Sign up")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
            .foregroundStyle(Color.black)
        }
        .padding(.vertical, 16)
    }
}
