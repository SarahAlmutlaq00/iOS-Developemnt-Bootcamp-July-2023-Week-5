//
//  PostScreenView.swift
//  threadsApp
//
//  Created by Sarah on 22/08/2023.
//

import SwiftUI

struct PostScreenView: View {
    @EnvironmentObject var userData : UserDataViewModel
    let postModel : PostModel
    let userModel: UserModel
    var body: some View {
        ScrollView(showsIndicators: false)
        {
            PostComponentView(
                postModel:postModel,
                userModel: userModel
            )
            Divider()
            ForEach (postModel.replies, id: \.self) { postId in
                if let post = userData.fetchPostById(postId) {
                    if let user = userData.fetchUserById(post.createdBy){
                        PostComponentView(postModel: post , userModel: user )
                    }
                  
                    Divider()
                }
            }
        }
        .navigationBarBackButtonHidden(false)
    }
}

//struct PostScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostScreenView()
//    }
//}
