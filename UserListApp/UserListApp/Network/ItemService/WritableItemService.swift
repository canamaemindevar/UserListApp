//
//  WritableItemService.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import Foundation

protocol WritableItemService {
    func addUser(_ item: ItemUIModel, completion: @escaping (Result<Void, NetworkErrors>) -> Void)
    func deleteUser(_ item: ItemUIModel, completion: @escaping (Result<Void, NetworkErrors>) -> Void)
    func clearUsers(completion: @escaping (Result<Void, NetworkErrors>) -> Void)
}
