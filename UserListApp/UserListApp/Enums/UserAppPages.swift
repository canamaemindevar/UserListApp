//
//  UserAppPages.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import SwiftUI

indirect enum UserAppPages: Identifiable,Hashable {
    case users
    case favorites
    case detail(AnyHashable)

    
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
                .init(systemName: "person.3.fill")
        case .favorites:
                .init(systemName: "star.fill")
        case .detail:
                .init("") // nil olmsli
        }
    }
}
