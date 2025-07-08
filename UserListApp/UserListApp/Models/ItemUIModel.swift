//
//  ItemUIModel.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import SwiftUICore

struct ItemUIModel: Hashable {
    let user: User?
    var isFavorite: Bool
    let leftCornerColor: Color
    
    init(
        responseModel: User?,
        isFavorite: Bool,
        color: Color = Color.random
    ) {
        self.user = responseModel
        
        self.isFavorite = isFavorite
        self.leftCornerColor = color
        
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(user?.id)
        hasher.combine(leftCornerColor)
    }
    
    static func == (lhs: ItemUIModel, rhs: ItemUIModel) -> Bool {
        lhs.user?.id == rhs.user?.id && lhs.leftCornerColor == rhs.leftCornerColor
    }
}
