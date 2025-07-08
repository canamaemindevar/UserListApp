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
               VStack(alignment: .center, spacing: 24) {

                   headerSection

                   profileSection

                   detailsSection

                   if let user = viewModel.user.user {
                       additionalInfoSection(user: user)
                   }
                   
                   Spacer(minLength: 100)
               }
               .padding()
           }
           .navigationBarTitleDisplayMode(.inline)
           .navigationTitle("User Details")
       }
}

private extension DetailView {
    var headerSection: some View {
        HStack {
            Capsule()
                .fill(viewModel.user.leftCornerColor)
                .frame(width: 8, height: 60)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("User Profile")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("Detailed Information")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.graySlate100)
        )
    }
    
    var profileSection: some View {
        VStack(spacing: 20) {
            // Profile Image
            AsyncImage(url: URL(string: viewModel.user.user?.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.gray)
            }
            .frame(width: 120, height: 120)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(viewModel.user.leftCornerColor, lineWidth: 4)
            )
            
            // Name
            VStack(spacing: 8) {
                Text("\(viewModel.user.user?.firstName ?? "Unknown") \(viewModel.user.user?.lastName ?? "")")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                // Age & Gender
                HStack {
                    if let age = viewModel.user.user?.age {
                        Label("\(age) age", systemImage: "calendar")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    if let gender = viewModel.user.user?.gender {
                        Label(gender.rawValue.capitalized, systemImage: "person")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.graySlate100)
        )
    }
    
    var detailsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Personal Information")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                
                // ID
                if let id = viewModel.user.user?.id {
                    InfoCard(title: "ID", value: "\(id)", icon: "number")
                }
                
                // Email
                if let email = viewModel.user.user?.email {
                    InfoCard(title: "Email", value: email, icon: "envelope")
                }
                
                // Phone
                if let phone = viewModel.user.user?.phone {
                    InfoCard(title: "Phone", value: phone, icon: "phone")
                }
                
                // Username
                if let username = viewModel.user.user?.username {
                    InfoCard(title: "Username", value: username, icon: "person.crop.circle")
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.graySlate100)
        )
    }
    
    func additionalInfoSection(user: User) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Additional Details")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            // Address
            if let address = user.address {
                VStack(alignment: .leading, spacing: 8) {
                    Label("Address", systemImage: "location")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(address.address ?? ""), \(address.city ?? "")")
                        Text("\(address.state ?? "") \(address.postalCode ?? "")")

                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.leading, 24)
                }
            }
            
            // university
            if let company = user.university {
                VStack(alignment: .leading, spacing: 8) {
                    Label("University", systemImage: "building.2")
                        .font(.headline)
                        .foregroundColor(.primary)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(company)
                        
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.leading, 24)
                    
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.graySlate100)
        )
    }
}
