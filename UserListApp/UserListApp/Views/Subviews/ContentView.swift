//
//  ContentView.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some View {
        TabbarView()
            .environmentObject(appCoordinator)
    }
}
