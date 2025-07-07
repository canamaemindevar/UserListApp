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
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.users, id: \.id) { user in
                        Text(user.firstName ?? "")
                            .onTapGesture {
//                                user.selection()
                                viewModel.writer?.addUser(user, completion: { result in
                                    switch result {
                                    case .success(let success):
                                        print(success)
                                    case .failure(let failure):
                                        print(failure)
                                    }
                                })
                            }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}
