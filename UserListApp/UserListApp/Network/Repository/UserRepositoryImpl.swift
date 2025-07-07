//
//  UserRepositoryImpl.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//

import Foundation

final class UserRepositoryImpl {

    private var networkManager: NetworkManagerInterface
    
    init(networkManagerInterface: NetworkManagerInterface = NetworkManager()) {
        self.networkManager = networkManagerInterface
    }
    
}

extension UserRepositoryImpl: ItemService {
    func loadItems(completion: @escaping (Result<ItemResponse, NetworkErrors>) -> Void) {
        let req = AppRequest(method: .get, url: AppServices.Users.base.url)
        networkManager.request(req, completion: completion)
    }
    
    
}
