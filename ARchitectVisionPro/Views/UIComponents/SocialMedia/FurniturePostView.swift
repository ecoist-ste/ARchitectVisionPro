//
//  FurniturePostView.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/20/25.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct FurniturePostView: View {
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                OnePostView(image: "table12d", name: "Table 1", description: "Side table, stone, 40x28cm", price: 83)
                OnePostView(image: "chair12d", name: "Chair 1", description: "Side table, stone, 40x28cm", price: 83)
                OnePostView(image: "table12d", name: "Table 1", description: "Side table, stone, 40x28cm", price: 83)
            }
            
        }
    }
}


struct OnePostView: View {
    
    @State private var presentSheet = false
    
    let image: String
    let name: String
    let description: String
    let price: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .frame(width: 300, height: 350)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    presentSheet = true
                }
                .sheet(isPresented: $presentSheet, onDismiss: {
                    presentSheet = false
                }, content: {
                    FurniturePostDetailView(image: "table12d", name: "Table 1", description: "Side table, stone, 40x28cm", price: 83)
                        .frame(width: 1000)
                })
            
                
            
            VStack(alignment: .leading) {
                Text(name).font(.title)
                Text(description)
                
            }
            .padding(.vertical)
            
            HStack {
                Text("\(price, format: .currency(code: "USD")) / piece")
                    .font(.title3)
                    .padding(.vertical)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                }
            }
            
           
            
        }
        .padding(.vertical)
        .padding(.horizontal, 20)
        .hoverEffect(.highlight)
        .hoverEffect { effect, isActive, _ in
            effect.scaleEffect(isActive ? 1.05: 1.0)
        }
        
    }
}

#Preview {
    FurniturePostView()
}
