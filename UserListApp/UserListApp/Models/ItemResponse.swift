//
//  ItemResponse.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import Foundation

struct ItemResponse: Decodable {
    let users: [User]?
    let total, skip, limit: Int?
    
}
