//
//  ContentView.swift
//  FirebaseApp
//
//  Created by لجين إبراهيم الكنهل on 16/11/1444 AH.
//

import SwiftUI
import FirebaseAuth
struct ContentView: View {
    
    var body: some View {
        VStack {
            
            Button("SignOut"){
                let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                } catch let signOutError as NSError {
                  print("Error signing out: %@", signOutError)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
