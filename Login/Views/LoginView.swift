//
//  TabView.swift
//  Login
//
//  Created by Deepak on 11/07/21.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    
    
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                ProfileView()
            } else{
            SignInView(viewModel: viewModel)
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
    
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct SignInView: View {
    
    var viewModel: AppViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.pink, Color.white, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Text("LOGIN")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                
                TextField("Enter your email id", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Enter your password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                //                            NavigationLink(
                //                                destination: ProfileView(),
                //                                label: {
                //                                    Text("Sign In")
                //                                        .foregroundColor(.white)
                //                                        .font(.title)
                //                                        .padding()
                //                                        .background(Color.accentColor)
                //                                        .cornerRadius(8.0)
                //                                        .shadow(color: .black, radius: 8, x: -5, y: 5)
                //                            })
                
                Button {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.signIn(email: email, password: password)
                } label: {
                    Text("Register me")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(8.0)
                        .shadow(color: .black, radius: 8, x: -5, y: 5)
                }
                Spacer()
                Spacer()
            }
        }
    }
}
