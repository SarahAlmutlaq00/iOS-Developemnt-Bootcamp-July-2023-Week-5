//
//  UserPreferencesViewModels.swift
//  threadsApp
//
//  Created by Sarah on 20/08/2023.
//

import Foundation
import SwiftUI

class UserPreferencesViewModels : ObservableObject {
    @AppStorage("userSessionToken") var token: String = ""
}
