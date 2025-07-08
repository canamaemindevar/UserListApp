//
//  ListViewModel.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import Foundation

final class ListViewModel: BaseViewModel {
    
    @Published var users: [ItemUIModel] = []
    @Published var searchText: String = ""
    
    private let itemService: ReadableItemService
    
    init(itemService: ReadableItemService) {
        self.itemService = itemService
        super.init()
        self.writer = LocalDbManager()
        self.loadFavorites()
    }
    
    var filteredUsers: [ItemUIModel] {
        guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return users
        }
        
        return users.filter {
            ($0.user?.firstName?.localizedCaseInsensitiveContains(searchText) ?? false) ||
            ($0.user?.lastName?.localizedCaseInsensitiveContains(searchText) ?? false) ||
            ($0.user?.username?.localizedCaseInsensitiveContains(searchText) ?? false)
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
                    self.users = (success.users ?? []).map {ItemUIModel(responseModel: $0, isFavorite: false)}
                }
            }
            
        case .failure(let failure):
            self.showError(failure)
        }
        self.setLoading(false)
    }
}
