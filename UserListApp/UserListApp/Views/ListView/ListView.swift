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
                    ForEach(viewModel.filteredUsers, id: \.user?.id) { user in
                        CellView(uiModel: user) {
                            if viewModel.isFavoritePath {
                                appCoordinator.pushTofavoritesTab(.detail(user))
                            } else {
                                appCoordinator.pushToHomeTab(.detail(user))
                            }
                            
                        } onFavoriteToggle: {
                            viewModel.toggleFavorite(for: user)
                            viewModel.refreshUserFavorites()
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
