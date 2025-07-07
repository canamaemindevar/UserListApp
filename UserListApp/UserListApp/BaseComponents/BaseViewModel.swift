//
//  BaseViewModel.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//
import SwiftUI

class BaseViewModel: ObservableObject {
    
    @Published var error: NetworkErrors?
    @Published var isErrorShown: Bool = false
    @Published var isLoading: Bool = false
    @Published var isRequestSuccesfull = false
    
    func showError(_ error: NetworkErrors?) {
        DispatchQueue.main.async {
            self.error = error
            self.isErrorShown = true
        }
    }
    
    func setLoading(_ isLoading: Bool) {
        DispatchQueue.main.async {
            self.isLoading = isLoading
        }
    }
    
    func resetErrors() {
        DispatchQueue.main.async {
            self.error = nil
            self.isErrorShown = false
        }
    }
}
