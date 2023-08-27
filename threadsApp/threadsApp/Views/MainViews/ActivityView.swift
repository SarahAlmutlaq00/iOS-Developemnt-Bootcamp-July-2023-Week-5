//
//  ActivityView.swift
//  threadsApp
//
//  Created by Sarah on 20/08/2023.
//

import SwiftUI

struct ActivityView: View {
    enum ActivityCategory: String, CaseIterable {
        case all
        case replies
        case mentioned
        case veritied
        var title: String {
            switch self {
            case .all: return"All"
            case .replies:return "Replies"
            case .mentioned:return "Mentioned"
            case .veritied: return "Verified"
            }
        }
    }
    
    @State var currentSelectedCategory: ActivityCategory = .all
    var body: some View {
        VStack{
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(ActivityCategory.allCases,id: \.self) {
                        category in
                        Button(
                            action: {
                                currentSelectedCategory=category
                            },
                            label: {
                                if currentSelectedCategory == category{
                                    Text (category.title)
                                        .frame(width:84)
                                    .padding(.horizontal, 16)
                                    .padding (.vertical, 8)
                                    .foregroundColor(.white)
                                    .background (
                                    RoundedRectangle(cornerRadius:12.5)
                                        .fill(.black)
                                    )
                                }else{
                                    Text (category.title)
                                        .frame(width:84)
                                    .padding(.horizontal, 16)
                                    .padding (.vertical, 8).background (
                                    RoundedRectangle(cornerRadius:12.5)
                                        .stroke(.gray.opacity(0.25))
                                    )
                                }
                               
                            }
                        )
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
            }
            ScrollView{
                ForEach(0..<10,id: \ .self){_ in
                    ActivityComponentView()
                    Divider()
                }
            }
            .padding(.top)
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
