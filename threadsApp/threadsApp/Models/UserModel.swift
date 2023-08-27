//
//  UserModel.swift
//  threadsApp
//
//  Created by Sarah on 24/08/2023.
//

import Foundation
struct UserModel: Identifiable {
    typealias ID = UUID
    let id: ID = .init()
    var username: String
    var fullname: Optional<String>
    var bio: Optional<String>
    var image: Optional<URL>
    var followers: Array<UserModel.ID>
    var following: Array<UserModel.ID>
    var posts : Array<PostModel.ID>
}
