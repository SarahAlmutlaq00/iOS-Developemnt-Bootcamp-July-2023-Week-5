//
//  PostModel.swift
//  threadsApp
//
//  Created by Sarah on 20/08/2023.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable {
    typealias ID = UUID
    let id: ID = .init()
    let content: Optional<String>
    let attachement: Array<URL>
    var likes: Array<UserModel.ID>
    var replies: Array<PostModel.ID>
    let createdAt: Date
    let createdBy: UserModel.ID
}

