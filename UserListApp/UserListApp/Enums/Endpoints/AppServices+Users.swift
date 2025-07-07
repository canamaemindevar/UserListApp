//
//  AppServices+Users.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import Foundation

extension AppServices {
    //users
    enum Users {
        case base
        var url: String {
            switch self {
            case .base:
                baseUrl.rawValue + "users"
            }
        }
    }
}
