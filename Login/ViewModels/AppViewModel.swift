//
//  AppViewModel.swift
//  Login
//
//  Created by Deepak on 12/07/21.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) {result, error in
            guard result != nil, error == nil else {
                return
            }
            
            // Success
        }
    }
    
    func signUp(email: String, password: String, name: String, selectedGenderIndex: Int, selectedDate: Date, city: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
            
            // Success
        }
    }
}
