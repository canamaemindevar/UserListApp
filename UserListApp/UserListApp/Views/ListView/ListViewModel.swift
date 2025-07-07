//
//  ListViewModel.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import Foundation

final class ListViewModel: BaseViewModel {
    
    @Published var users: [User] = []
    @Published var searchText: String = ""
    
    private let itemService: ReadableItemService
    
    init(itemService: ReadableItemService) {
        self.itemService = itemService
        super.init()
        self.writer = LocalDbManager()
    }
    
    var filteredUsers: [User] {
        guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return users
        }
        
        return users.filter {
            ($0.firstName?.localizedCaseInsensitiveContains(searchText) ?? false) ||
            ($0.lastName?.localizedCaseInsensitiveContains(searchText) ?? false) ||
            ($0.username?.localizedCaseInsensitiveContains(searchText) ?? false)
        }
    }
}

extension ListViewModel {
    
    func fetchUsers () {
        self.setLoading(true)
        itemService.loadItems { [weak self] result in
            self?.handleFetchUserResponse(result)
        }
    }
}

private extension ListViewModel {
    
    func handleFetchUserResponse(_ result: Result<ItemResponse, NetworkErrors>) {
        
        switch result {
        case .success(let success):
            if !success.users.isNilOrEmpty {
                DispatchQueue.main.async {
                    self.users = success.users ?? []
                }
            }
            
        case .failure(let failure):
            self.showError(failure)
        }
        self.setLoading(false)
    }
}
