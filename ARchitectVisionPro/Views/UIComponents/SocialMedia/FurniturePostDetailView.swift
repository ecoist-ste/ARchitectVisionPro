//
//  FurniturePostDetailView.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/20/25.
//

import SwiftUI

struct FurniturePostDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    let image: String
    let name: String
    let description: String
    let price: Double
    
    var body: some View {
        GeometryReader3D { proxy in
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: proxy.size.width / 1.8)
                VStack {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                        }

                    }
                }
                
            }
        }
        .glassBackgroundEffect()
        
    }
}

#Preview {
    FurniturePostDetailView(image: "table12d", name: "Table 1", description: "Side table, stone, 40x28cm", price: 83)
}
