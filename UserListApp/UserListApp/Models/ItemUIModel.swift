//
//  ItemUIModel.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import SwiftUICore

struct ItemUIModel {
    let user: User?
    let selection: () -> Void
    let onFavoriteToggle: () -> Void
    let isFavorite: Bool
    let leftCornerColor: Color

    init(
        responseModel: User?,
        isFavorite: Bool,
        color: Color = Color.random,
        selection: @escaping () -> Void,
        onFavoriteToggle: @escaping () -> Void
    ) {
        self.user = responseModel
        self.selection = selection
        self.isFavorite = isFavorite
        self.leftCornerColor = color
        self.onFavoriteToggle = onFavoriteToggle
    }
}
