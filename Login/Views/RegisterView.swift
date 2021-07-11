//
//  ContentView.swift
//  Login
//
//  Created by Deepak on 11/07/21.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var city: String = ""
    
    var gender = ["Male", "Female", "Others"]
    @State private var selectedGenderIndex = 0
    
    @State var selectedDate = Date()
    
    @State var showLoginView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.pink, Color.white, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    
                    // Spacer()
                    
                    TextField("Enter your email id", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Enter your name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Text("Select your gender")
                    
                    Picker("Select your gender", selection: $selectedGenderIndex) {
                        ForEach(0..<gender.count) {
                            Text(self.gender[$0])
                        }
                    }
                    
                    
                    DatePicker("Date of birth", selection: $selectedDate, displayedComponents: .date)
                        .padding()
                    
                    TextField("Enter your city", text: $city)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
//                    NavigationLink(
//                        destination: ProfileView(),
//                        label: {
//                            Text("Register me")
//                                .foregroundColor(.white)
//                                .font(.title)
//                                .padding()
//                                .background(Color.accentColor)
//                                .cornerRadius(8.0)
//                                .shadow(color: .black, radius: 8, x: -5, y: 5)
//                        })
                    Button {
                        
                        guard !email.isEmpty, !password.isEmpty, !name.isEmpty, !city.isEmpty else {
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
                    if viewModel.isSignedIn {
                        ProfileView()
                    } else {
                        RegisterView()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("CREATE NEW ACCOUNT")
                        .bold()
                }
            }
            .navigationBarItems(trailing:
                                    Button(
                                        action: {
                                            showLoginView.toggle()
                                        },
                                        label: {
                                            Text("Login")
                                        }
                                    )
                                    .sheet(isPresented: $showLoginView, content: {
                                        LoginView()
                                    })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
