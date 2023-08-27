//
//  threadsAppApp.swift
//  threadsApp
//
//  Created by Sarah on 20/08/2023.
//

import SwiftUI

@main
struct threadsAppApp: App {
    @ObservedObject var userPreferences = UserPreferencesViewModels()
    @ObservedObject var Auth = AuthViewModel()
    @ObservedObject var userData = UserDataViewModel()
    init(){
        Auth.reset()
        
    }
    var body: some Scene {
        WindowGroup {
     
                RootView()
                    .environmentObject(userPreferences)
                    .environmentObject(Auth)
                    .environmentObject(userData)
            
        }
    }
}
