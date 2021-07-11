//
//  TabView.swift
//  Login
//
//  Created by Deepak on 11/07/21.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.pink, Color.white, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("hello")
                }
            }
            .navigationBarTitle(Text("Login"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "x.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.accentColor)
            })
            )
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
