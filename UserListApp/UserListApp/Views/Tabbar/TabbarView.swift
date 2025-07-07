//
//  TabbarView.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//

import SwiftUI

struct TabbarView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator
    var body: some View {
        TabView {
            
            NavigationStack(path: $appCoordinator.homeTabPath) {
                
                ListView()
                    .navigationDestination(for: UserAppPages.self) { page in
                        appCoordinator.build(page: page)
                    }
            }
            .tabItem {
                TabItem(pageChoice: .users)
            }
            
            NavigationStack(path: $appCoordinator.favoritesTabPath) {
                
                ListView()
                    .navigationDestination(for: UserAppPages.self) { page in
                        appCoordinator.build(page: page)
                    }
            }
            .tabItem {
                TabItem(pageChoice: .favorites)
            }
        }
    }
}

