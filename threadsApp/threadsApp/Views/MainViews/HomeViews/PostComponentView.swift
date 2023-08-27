//
//  PostComponentView.swift
//  threadsApp
//
//  Created by Sarah on 21/08/2023.
//

import SwiftUI

struct PostComponentView: View {
    @EnvironmentObject var auth: AuthViewModel
//    @State var postModel: PostModel
    let postModel: PostModel
    let userModel: UserModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack(alignment: .top){
                VStack(spacing: 4) {
                    AsyncImage(url: URL(string:"https://source.unsplash.com/60x60/?[user]"))
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(2)

                }

                VStack(alignment: .leading){
                    HStack{
                        Text(userModel.username)
                            .bold()
                        Spacer()
                        Text(makePrettyDate())
                            .foregroundColor(.gray)
                        Image(systemName: "ellipsis")
                    }
                    
                    if let content = postModel.content {
                        Text(content)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    if postModel.attachement.count > 0 {
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack{
                                ForEach(postModel.attachement, id: \.self) { attachment in
                                    AsyncImage(url: attachment) {result in
                                        if let image =
                                            result.image{
                                            image
                                                .resizable()
                                                .scaledToFit()
                                        }else{
                                            ProgressView()
                                        }
                                    }.frame(width: 300 ,height: 200)
                                        .cornerRadius(8)
                                }
                            }
                        }
                    }

                    HStack {
                        if postModel.likes.contains(UUID(uuidString: auth.currentUserId)!){
                            Image(systemName:"heart.fill")
                        }else{
                            Image(systemName:"heart")
                        }
                        Image(systemName:"bubble.right" )
                        Image(systemName:"arrow.triangle.2.circlepath" )
                        Image(systemName:"paperplane")
                      
                    }

                    
                    HStack{
                        Text(postModel.replies.count.description)
                            .foregroundColor(.gray)
                        Text("replies")
                            .foregroundColor(.gray)
                        Text(postModel.likes.count.description)
                            .foregroundColor(.gray)
                        Text("likes")
                            .foregroundColor(.gray)
                    } .padding(.top, 4)
                }
            }.padding(.horizontal)
            
        }
    }
    func makePrettyDate() -> String {
        let components = Calendar.current.dateComponents([.minute, .hour, .day], from: postModel.createdAt, to: Date())
        
        if let minuteCount = components.minute {
            if minuteCount >= 60 {
                if let hoursCount = components.hour {
                    if hoursCount >= 24 {
                        if let dayCount = components.day {
                            if dayCount >= 28 {
                                return postModel.createdAt.formatted(date: .long, time: .omitted)
                                
                            } else {
                                return" \(dayCount) d"
                            }
                        }
                        
                    } else {
                        return " \(hoursCount)h"
                    }
                    
                }
            } else {
                return "\(minuteCount) m"
            }
        }
        return postModel.createdAt
            .formatted(date: .long, time: .omitted)
    }
}

//struct PostComponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostComponentView()
//    }
//}
