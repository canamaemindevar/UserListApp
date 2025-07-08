//
//  DetailView.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 8.07.2025.
//
import SwiftUI

struct DetailView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @StateObject var viewModel: DetailViewModel
    
    init(user: ItemUIModel) {
        self._viewModel = StateObject(wrappedValue: DetailViewModel(user: user))
    }
    
    
    var body: some View {
        ScrollView {
            Text(viewModel.user.user?.firstName ?? "First Name")
        }
    }
}
