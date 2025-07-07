//
//  NetworkManagerInterface.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//

import Foundation

protocol NetworkManagerInterface {
    func request<T: Decodable>(_ endpoint: AppRequest, completion: @escaping (Result<T, NetworkErrors>) -> Void)
}
