//
//  TabbarView.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//

import SwiftUI

struct TabbarView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @StateObject private var viewModelWithService = ListViewModel(itemService: UserRepositoryImpl())
    @StateObject private var viewModelWithStorageService = ListViewModel(itemService: LocalDbManager())
    var body: some View {
        TabView {
            
            NavigationStack(path: $appCoordinator.homeTabPath) {
                
                ListView(viewModel: viewModelWithService)
                    .navigationDestination(for: UserAppPages.self) { page in
                        appCoordinator.build(page: page)
                    }
            }
            .tabItem {
                TabItem(pageChoice: .users)
            }
            
            NavigationStack(path: $appCoordinator.favoritesTabPath) {
                
                ListView(viewModel: viewModelWithStorageService)
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

