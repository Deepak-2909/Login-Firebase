//
//  TabView.swift
//  Login
//
//  Created by Deepak on 11/07/21.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    @State var showLoginView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.pink, Color.white, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    
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
                    
                    
                        NavigationLink(
                            destination: ProfileView(),
                            label: {
                                Text("Sign In")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding()
                                    .background(Color.accentColor)
                                    .cornerRadius(8.0)
                                    .shadow(color: .black, radius: 8, x: -5, y: 5)
                        })                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("LOGIN")
                        .bold()
                }
            }        }
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
