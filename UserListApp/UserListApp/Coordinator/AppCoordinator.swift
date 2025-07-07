//
//  AppCoordinator.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//

import SwiftUI

final class AppCoordinator: ObservableObject {
    
    @Published var homeTabPath = NavigationPath()
    @Published var favoritesTabPath = NavigationPath()
    
    func pushToRedTab(_ page: UserAppPages) {
        homeTabPath.append(page)
    }
    
    func popHomeTab() {
        if !homeTabPath.isEmpty {
            homeTabPath.removeLast()
        }
    }
    
    func popToRootHomeTab() {
        homeTabPath.removeLast(homeTabPath.count)
    }
    
    func pushTofavoritesTab(_ page: UserAppPages) {
        favoritesTabPath.append(page)
    }
    
    func popfavoritesTab() {
        if !favoritesTabPath.isEmpty {
            favoritesTabPath.removeLast()
        }
    }
    
    func popToRootBlueTab() {
        favoritesTabPath.removeLast(favoritesTabPath.count)
    }
    
    @ViewBuilder
    func build(page: UserAppPages) -> some View {
        switch page {
        case .users:
            EmptyView()
        case .favorites:
            EmptyView()
        case .detail:
             EmptyView()
        }
    }
}
