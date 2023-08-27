//
//  MianView.swift
//  threadsApp
//
//  Created by Sarah on 20/08/2023.
//

import SwiftUI

struct MianView: View {

    enum Screen:String, CaseIterable{
        
        case home
        case search
        case newpost
        case activity
        case profile
        
        var title : String {
            
            switch self {
                
            case .home: return "Home"
            case .search: return "Search"
            case .newpost: return "Newpost"
            case .activity: return "Activity"
            case .profile: return "Profile"
            }
        }
        var body:  AnyView {
            switch self {
            case .home:
                return AnyView(HomeView())
            case .search:
                return AnyView(SearchView())
            case .newpost:
                return AnyView(NewPostView())
            case .activity:
                return AnyView(ActivityView())
            case .profile:
                return AnyView(ProfileView())
            }
        }
        var imageUser : String {
            
            switch self {
            case .home: return "house"
            case .search: return "magnifyingglass"
            case .newpost: return "plus"
            case .activity: return "heart"
            case .profile: return "person"
            }
        }
    }
    @State var currenttitle: String = "Home"
    var body: some View {
        NavigationView{
            TabView{
                ForEach(Screen.allCases, id: \.self ){ screen in
                    screen.body
                        .tabItem {
                            Label (
                            screen.title,
                            systemImage:
                            screen.imageUser
                            )
                        }
                         .onAppear{
                            currenttitle = screen.title
                    }
                }
            }
            .background(Color.white)
            .navigationTitle(currenttitle)
        }
    }
}
        

struct MianView_Previews: PreviewProvider {
    static var previews: some View {
        MianView()
    }
}
