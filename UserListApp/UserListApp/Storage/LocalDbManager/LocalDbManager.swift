//
//  LocalDbManager.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import Foundation

final class LocalDbManager {
    
    private let userDefaults = UserDefaults.standard
    private let storageKey = "saved_users"
}

// MARK: - Private
private extension LocalDbManager {
    
    func fetchAllUsers() -> [User] {
        guard let data = userDefaults.data(forKey: storageKey),
              let users = try? JSONDecoder().decode([User].self, from: data) else {
            return []
        }
        return users
    }
    
    func saveAllUsers(_ users: [User]) throws {
        let data = try JSONEncoder().encode(users)
        userDefaults.set(data, forKey: storageKey)
    }
}

extension LocalDbManager: ReadableItemService {
    // Load all users
    func loadItems(completion: @escaping (Result<ItemResponse, NetworkErrors>) -> Void) {
        let users = fetchAllUsers()
        let response = ItemResponse(users: users, total: users.count, skip: 0, limit: users.count)
        completion(.success(response))
    }
    
    
}

extension LocalDbManager: WritableItemService {
    // Add user
    func addUser(_ user: User, completion: @escaping (Result<Void, NetworkErrors>) -> Void) {
        var currentUsers = fetchAllUsers()
        guard !currentUsers.contains(user) else {
            return completion(.failure(.storageFailure))
        }
        currentUsers.append(user)
        do {
            try saveAllUsers(currentUsers)
            completion(.success(()))
        } catch {
            completion(.failure(.storageFailure))
        }
    }
    
    // Delete user
    func deleteUser(_ user: User, completion: @escaping (Result<Void, NetworkErrors>) -> Void) {
        var currentUsers = fetchAllUsers()
        let originalCount = currentUsers.count
        currentUsers.removeAll { $0.id == user.id }
        guard currentUsers.count < originalCount else {
            return completion(.failure(.storageFailure))
        }
        do {
            try saveAllUsers(currentUsers)
            completion(.success(()))
        } catch {
            completion(.failure(.storageFailure))
        }
    }
    
    // Clear all
    func clearUsers(completion: @escaping (Result<Void, NetworkErrors>) -> Void) {
        userDefaults.removeObject(forKey: storageKey)
        if userDefaults.data(forKey: storageKey) == nil {
            completion(.success(()))
        } else {
            completion(.failure(.storageFailure))
        }
    }
}
