//
//  ListView.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import SwiftUI

struct ListView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @ObservedObject var viewModel: ListViewModel
    @FocusState private var isSearchFocused: Bool
    
    var body: some View {
        VStack {
            TextField("Search users...", text: $viewModel.searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding([.horizontal, .top])
                .focused($isSearchFocused)
                .submitLabel(.done)
            
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.filteredUsers, id: \.id) { user in
                        Text(user.firstName ?? "")
                            .onTapGesture {
                                viewModel.addUserToLocal(user)
                                isSearchFocused = false
                            }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isSearchFocused = false
        }
    }
}
