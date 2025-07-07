//
//  Optional+Extension.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//

import Foundation

extension Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
