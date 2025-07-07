//
//  CellView.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 8.07.2025.
//

import SwiftUI

struct CellView: View {
    
    let uiModel: ItemUIModel
    
    var body: some View {
        HStack(spacing: 0) {
            
            Capsule()
                .fill(uiModel.leftCornerColor)
                .frame(width: 5)
                .frame(maxHeight: .infinity)
                .zIndex(1)
            
            VStack(alignment: .leading, spacing: 8) {
                
                // MARK: Üst Bilgi Satırı
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(uiModel.user?.firstName ?? "-") \(uiModel.user?.lastName ?? "")")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text("\(uiModel.user?.age.map { "\($0) yaş" } ?? "") \(uiModel.user?.gender?.rawValue.capitalized ?? "")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        uiModel.onFavoriteToggle()
                    }) {
                        Image(systemName: uiModel.isFavorite ? "star.fill" : "star")
                            .foregroundColor(uiModel.isFavorite ? .yellow : .gray)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                // MARK: Alt Bilgi Satırı
                Button(action: uiModel.selection) {
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
        .padding(.horizontal)
    }
}
