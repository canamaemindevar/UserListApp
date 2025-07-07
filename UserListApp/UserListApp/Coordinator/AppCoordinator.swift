//
//  AppCoordinator.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//

import SwiftUI

indirect enum UserAppPages: Identifiable,Hashable {
    case users
    case favorites
    case detail

    
    var id: String {
        switch self {
        case .users:
            return "users"
        case .favorites:
            return "favorites"
        case .detail:
            return "detail"
        }
    }
    
    var title: String {
        switch self {
        case .users:
            return "Users"
        case .favorites:
            return "Favorites"
        case .detail:
            return "Detail"
        }
    }
    
    var tabIcon: Image {
        switch self {
        case .users:
                .init(systemName: "person.crop.circle") // person.3.fill
        case .favorites:
                .init(systemName: "star.fill") 
        case .detail:
                .init("") // nil olmsli
        }
    }
}

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
