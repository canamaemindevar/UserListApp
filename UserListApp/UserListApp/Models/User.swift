//
//  User.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import Foundation

struct User: Codable, Hashable {
    
    let id: Int?
    let firstName, lastName, maidenName: String?
    let age: Int?
    let gender: Gender?
    let email, phone, username, password: String?
    let birthDate: String?
    let image: String?
    let bloodGroup: String?
    let height, weight: Double?
    let eyeColor: String?
    let address: Address?
    let university: String?
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Address: Codable, Hashable {
    let address, city, state, stateCode: String?
    let postalCode: String?
}

enum Gender: String, Codable {
    case female
    case male
}
