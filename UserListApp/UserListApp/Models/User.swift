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
    
    init(
        id: Int? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        maidenName: String? = nil,
        age: Int? = nil,
        gender: Gender? = nil,
        email: String? = nil,
        phone: String? = nil,
        username: String? = nil,
        password: String? = nil,
        birthDate: String? = nil,
        image: String? = nil,
        bloodGroup: String? = nil,
        height: Double? = nil,
        weight: Double? = nil,
        eyeColor: String? = nil,
        address: Address? = nil,
        university: String? = nil
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.maidenName = maidenName
        self.age = age
        self.gender = gender
        self.email = email
        self.phone = phone
        self.username = username
        self.password = password
        self.birthDate = birthDate
        self.image = image
        self.bloodGroup = bloodGroup
        self.height = height
        self.weight = weight
        self.eyeColor = eyeColor
        self.address = address
        self.university = university
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
