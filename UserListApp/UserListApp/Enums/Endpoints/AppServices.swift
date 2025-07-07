//
//  AppServices.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import Foundation

enum AppServices {
    case baseUrl
    
    var rawValue: String {
        switch self {
        case .baseUrl:
            return "https://dummyjson.com/" // baseUrl
        }
    }
}

