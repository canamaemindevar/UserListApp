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
    let rating = 4.5
    let date = "22.08.2025"
    let time = "10.00"
    let leftCornerColor = Color.random
    
    init(responseModel: User?, selection: @escaping () -> Void) {
        self.user = responseModel
        self.selection = selection
    }
}
