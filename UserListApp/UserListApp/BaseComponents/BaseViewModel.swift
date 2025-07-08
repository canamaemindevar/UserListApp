//
//  BaseViewModel.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import SwiftUI

class BaseViewModel: ObservableObject {
    
    @Published var error: NetworkErrors?
    @Published var isErrorShown: Bool = false
    @Published var isLoading: Bool = false
    @Published var isRequestSuccesfull = false
    @Published var favoriteUserIds: Set<Int> = []
    
    var writer: (any WritableItemService)?
    
    func showError(_ error: NetworkErrors?) {
        DispatchQueue.main.async {
            self.error = error
            self.isErrorShown = true
        }
    }
    
    func setLoading(_ isLoading: Bool) {
        DispatchQueue.main.async {
            self.isLoading = isLoading
        }
    }
    
    func resetErrors() {
        DispatchQueue.main.async {
            self.error = nil
            self.isErrorShown = false
        }
    }
}

extension BaseViewModel {
    
    func addUserToLocal(_ user: ItemUIModel, completion: @escaping (Bool) -> Void) {
        setLoading(true)
        writer?.addUser(user.user ?? .init()) { [weak self] result in
            DispatchQueue.main.async {
                self?.setLoading(false)
                switch result {
                case .success:
                    self?.isRequestSuccesfull = true
                    completion(true)
                case .failure(let error):
                    self?.showError(error)
                    completion(false)
                }
            }
        }
    }

    func deleteUserFromLocal(_ user: ItemUIModel, completion: @escaping (Bool) -> Void) {
        setLoading(true)
        writer?.deleteUser(user.user ?? .init()) { [weak self] result in
            DispatchQueue.main.async {
                self?.setLoading(false)
                switch result {
                case .success:
                    self?.isRequestSuccesfull = true
                    completion(true)
                case .failure(let error):
                    self?.showError(error)
                    completion(false)
                }
            }
        }
    }

    func clearAllUsersFromLocal() {
        setLoading(true)
        writer?.clearUsers { [weak self] result in
            DispatchQueue.main.async {
                self?.setLoading(false)
                switch result {
                case .success:
                    self?.isRequestSuccesfull = true
                case .failure(let error):
                    self?.showError(error)
                }
            }
        }
    }
}

extension BaseViewModel {
    
    func isUserFavorited(_ user: ItemUIModel) -> Bool {
        guard let id = user.user?.id else { return false }
        return favoriteUserIds.contains(id)
    }

    func toggleFavorite(for user: ItemUIModel) {
        guard let id = user.user?.id else { return }

        if isUserFavorited(user) {
            deleteUserFromLocal(user, completion: { [weak self] success in
                if success {
                    self?.favoriteUserIds.remove(id)
                }
            })
        } else {
            addUserToLocal(user, completion: { [weak self] success in
                if success {
                    self?.favoriteUserIds.insert(id)
                }
            })
        }
    }

    func loadFavorites() {
        if let localManager = writer as? ReadableItemService {
            localManager.loadItems { [weak self] result in
                if case .success(let response) = result {
                    let ids = response.users?.compactMap { $0.id } ?? []
                    DispatchQueue.main.async {
                        self?.favoriteUserIds = Set(ids)
                    }
                }
            }
        }
    }
}
