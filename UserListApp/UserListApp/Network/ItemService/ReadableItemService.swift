//
//  ItemService.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//

protocol ReadableItemService {
    func loadItems(completion: @escaping (Result<ItemResponse, NetworkErrors>) -> Void)
}
