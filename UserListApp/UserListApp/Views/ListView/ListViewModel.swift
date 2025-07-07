//
//  ListViewModel.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import Foundation

final class ListViewModel: BaseViewModel {
    
    @Published var users: [User] = []
    
    private let itemService: ReadableItemService
    
    init(itemService: ReadableItemService) {
        self.itemService = itemService
        super.init()
        self.writer = LocalDbManager()
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
