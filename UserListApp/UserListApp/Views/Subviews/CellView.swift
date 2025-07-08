//
//  CellView.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 8.07.2025.
//

import SwiftUI

struct CellView: View {
    
    let uiModel: ItemUIModel
    let selection: () -> Void
    let onFavoriteToggle: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            
            Capsule()
                .fill(uiModel.leftCornerColor)
                .frame(width: 5)
                .frame(maxHeight: .infinity)
                .zIndex(1)
            
            VStack(alignment: .leading, spacing: 8) {
                
                // MARK: Üst Satır
                HStack(alignment: .top) {
                    // Sol tarafta image
                    AsyncImage(url: URL(string: uiModel.user?.image ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    
                    // Orta kısımda yazılar
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(uiModel.user?.firstName ?? "-") \(uiModel.user?.lastName ?? "")")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text("\(uiModel.user?.age.map { "\($0) age" } ?? "") \(uiModel.user?.gender?.rawValue.capitalized ?? "")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    // Sağ tarafta favorite button
                    Button(action: {
                        onFavoriteToggle()
                    }) {
                        Image(systemName: uiModel.isFavorite ? "star.fill" : "star")
                            .foregroundColor(uiModel.isFavorite ? .yellow : .gray)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                // MARK: Alt Satır
                
                Button {
                    selection()
                } label: {
                    HStack {
                        Text("See Detail")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.blue)
                            .font(.footnote)
                    }
                    .padding(.top, 6)
                }

            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.graySlate100)
                    .offset(x: -4)
            )
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
