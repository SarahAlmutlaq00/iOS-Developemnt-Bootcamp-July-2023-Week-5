//
//  ProfileView.swift
//  threadsApp
//
//  Created by Sarah on 20/08/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var  auth :AuthViewModel
    @EnvironmentObject  var userDate : UserDataViewModel
    
    @State var currentUser: Optional<UserModel> = nil
    @State var currentUserPosts: Array<PostModel> = []
    
    var body: some View {
        VStack(alignment:.leading){
            if let currentUser = currentUser{
                //profile info section
                VStack(alignment:.leading){
                    //Header
                    HStack{
                        Spacer()
                        Button(action: {
                            auth.signOut()
                        }, label: {
                          Text("LogOut")
                           }
                        )
                    }
                    
                    // user info section
                    HStack{
                        VStack(alignment: .leading){
                            if let fullname = currentUser.fullname{
                                Text(fullname)
                                    .font(.title)
                            }
                          
                            Text(currentUser.username)
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        AsyncImage( url:currentUser.image) {result in
                            if let image =
                                result.image{
                                image
                                    .resizable()
                                    .scaledToFill()
                            }else{
                                ProgressView()
                            }
                        }
                        .clipShape(Circle())
                        .frame(width: 75,height: 75)
                    }
                    //Bio
                    if let bio = currentUser.bio{
                        Text(bio)
                    }
                   
                    Text("\(currentUser.followers.count)followers")
                    //user Actions
                    HStack{
                        Button(action: {
                    // showEditProfileScreenView = true
                        }, label: {
                          Text("Edit profile")
                                .frame (maxWidth: .infinity)
                                .padding(.horizontal,16)
                                .padding(.vertical,8)
                                .background (Color.black)
                                .foregroundColor (.white)
                                .cornerRadius (6.25)
                           }
                        )
                        Button(action: {
                //   showActivitySharingMethod = true
                        }, label: {
                          Text("Share profile")
                                .frame(maxWidth:.infinity)
                                .padding(.horizontal,16)
                                .padding(.vertical,8)
                                .background(RoundedRectangle(cornerRadius: 6.25).stroke(.gray.opacity(0.25))
                                )
                           }
                        )
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
            }else{
                //profile info section
                VStack(alignment:.leading){
                    //Header
                    HStack{
                        Spacer()
                        Button(action: {
                            auth.signOut()
                        }, label: {
                          Text("LogOut")
                           }
                        )
                    }
                    
                    // user info section
                    HStack{
                        VStack(alignment: .leading){
                            Text(String(repeating: "*", count: 16))
                                .font(.title)
                            Text(String(repeating: "*", count: 24))
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                         Circle()
                        .frame(width: 75,height: 75)
                    }
                    //Bio
                    Text(String(repeating: "*", count: 128))
                    Text("12 follower")
                    //user Actions
                    HStack{
                        Button(action: {
                    // showEditProfileScreenView = true
                        }, label: {
                          Text("Edit profile")
                                .frame (maxWidth: .infinity)
                                .padding(.horizontal,16)
                                .padding(.vertical,8)
                                .background (Color.black)
                                .foregroundColor (.white)
                                .cornerRadius (6.25)
                           }
                        )
                        .disabled(true)
                        Button(action: {
                //   showActivitySharingMethod = true
                        }, label: {
                          Text("Share profile")
                                .frame(maxWidth:.infinity)
                                .padding(.horizontal,16)
                                .padding(.vertical,8)
                                .background(RoundedRectangle(cornerRadius: 6.25).stroke(.gray.opacity(0.25))
                                )
                           }
                        )
                        .buttonStyle(.plain)
                        .disabled(true)
                    }
                }
                .padding(.horizontal)
            }

            //Posts
            ScrollView(showsIndicators: false){
                ForEach(currentUserPosts){post in
                    if let user = userDate.fetchUserById(post.createdBy){
                        NavigationLink(
                            destination: {
                            PostScreenView(
                                postModel: post,
                                userModel: user)
                                
                        },label: {
                            PostComponentView(
                                postModel: post,
                                userModel: user)
                                
                            }
                        )
                        .buttonStyle(.plain)
                        Divider()
                    }
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)){
                if let uuid = UUID(uuidString: auth.currentUserId) {
                    if let user = userDate.fetchUserById(uuid) {
                        currentUser = user
                    }
                    currentUserPosts=userDate.posts.filter{ post in
                        return post.createdBy == uuid
                        
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
