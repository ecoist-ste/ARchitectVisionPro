//
//  TabControllerView.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/20/25.
//

import SwiftUI


struct TabControllerView: View {
    @State private var selectedTab: TabItem = .home
    var body: some View {
        TabView(selection: $selectedTab) {
            
            Tab(TabItem.home.name, systemImage: TabItem.home.image, value: .home) {
                SocialMediaLandingView()
            }
            
            Tab(TabItem.projects.name, systemImage: TabItem.projects.image, value: .projects) {
                MyProjectsView()
            }
            
            Tab(TabItem.profile.name, systemImage: TabItem.profile.image, value: .profile) {
                MyProfileView()
            }
        }
    }
}

enum TabItem: CaseIterable {
    case home // social media feed
    case projects // user's own projects
    case profile // user's personal information
    
    var name: String {
        switch self {
            case .home:
                return "Home"
            case .projects:
                return "My Projects"
            case .profile:
                return "My Profile"
        }
    }
    
    var image: String {
        switch self {
            case .home:
                return "house.circle.fill"
            case .projects:
                return "hammer.circle.fill"
            case .profile:
                return "person.circle.fill"
        }
    }
}



#Preview {
    TabControllerView()
}
