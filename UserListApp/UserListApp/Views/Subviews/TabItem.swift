//
//  TabItem.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import SwiftUI

struct TabItem: View {
    let pageChoice: UserAppPages

    var body: some View {
        VStack {
            pageChoice.tabIcon
            Text(pageChoice.title)
        }
    }
}
