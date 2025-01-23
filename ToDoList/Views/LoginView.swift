//
//  LoginView.swift
//  ToDoList
//
//  Created by 안지희 on 12/24/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get things Done", angle: 15, background: .pink)
                    .offset(y: 0)
                
               
                
                Form {
                    //경고메세지 출력
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Login",
                        background: .blue
                    ) {
                        viewModel.login()
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
                .offset(y: -50)
                
                Spacer()
                
                // Create Account Section
                VStack(spacing: 8) {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    LoginView()
}
