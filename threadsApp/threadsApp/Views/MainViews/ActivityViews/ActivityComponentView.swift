//
//  ActivityComponentView.swift
//  threadsApp
//
//  Created by Sarah on 23/08/2023.
//

import SwiftUI

struct ActivityComponentView: View {
    var body: some View {
        HStack(alignment: .top){
            AsyncImage( url:URL(string: "https://source.unsplash.com/100x100/?person")) {result in
                if let image =
                    result.image{
                    image
                        .resizable()
                        .scaledToFit()
                }else{
                    ProgressView()
                }
            }
            .frame(width: 50 ,height: 50)
            .cornerRadius(25)
            
            VStack(alignment: .leading){
                HStack{
                    Text("Username")
                        .fontWeight(.medium)
                    Text("12s")
                        .foregroundColor(.gray)
                }
                Text("Followed you")
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            Spacer()
           Button(
            action:{
                
            }, label: {
                Text("Follow")
                    .padding(.horizontal,16)
                    .padding(.vertical, 8)
                    .background(RoundedRectangle(cornerRadius: 12.5).stroke(.gray.opacity(0.25)))
            }
           )
           .buttonStyle(.plain)
        }
        .padding(.horizontal)
    }
}

//struct ActivityComponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityComponentView()
//    }
//}
