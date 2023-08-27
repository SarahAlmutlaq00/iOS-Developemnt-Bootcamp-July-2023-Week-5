//
//  AuthViewModel.swift
//  threadsApp
//
//  Created by Sarah on 20/08/2023.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @AppStorage ("currentUserId") var currentUserId : String = ""
    
    func signIn(_ id :UserModel.ID)->Bool {
        currentUserId = id.uuidString
        return true
    }
    
    func signOut() {
        currentUserId = ""
    }
    func reset(){
        currentUserId = ""
    }
}
