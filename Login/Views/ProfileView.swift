//
//  ProfileView.swift
//  Login
//
//  Created by Deepak on 11/07/21.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.pink, Color.white, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Signed In!")
                Button(action: {
                    viewModel.signOut()
                },
                       label: {
                    Text("Sign Out")
                })
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
