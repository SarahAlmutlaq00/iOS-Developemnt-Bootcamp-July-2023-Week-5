//
//  HomeView.swift
//  threadsApp
//
//  Created by Sarah on 20/08/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject  var userDate : UserDataViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false){
            ForEach(userDate.posts) {  post in
                if let user = userDate.fetchUserById(post.createdBy){
                    NavigationLink(
                        destination: {
                        PostScreenView(
                            postModel: post,
                            userModel: user)
                            
                    },label: { PostComponentView(postModel: post,
                                                 userModel: user
                    )
                }
            )
                    .buttonStyle(.plain)
                    Divider()
                }

            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
