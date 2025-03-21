//
//  FurniturePostDetailView.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/20/25.
//

import SwiftUI

struct FurniturePostDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @State private var isImmersive = false
    @State private var count = 1
    
    let image: String
    let name: String
    let description: String
    let moreDescription: String = """
This modern lounge chair features a curved wooden frame with a smooth walnut finish, 
paired with plush, foam-filled cushions upholstered in soft gray fabric. 
"""
    let price: Double
    
    let productInformationLabels: [String] = [
        "Product details",
        "Measurements",
        "Delivery",
        "Assembly instructions"
    ]
    
    var body: some View {
        GeometryReader3D { proxy in
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: proxy.size.width / 1.8)
                    .overlay {
                        Button(isImmersive ? "Finish preview" : "Preview in your space") {
                            Task {
                                if isImmersive {
                                    await dismissImmersiveSpace()
                                } else {
                                    await openImmersiveSpace(id: "PreviewFurniture")
                                }
                                
                                isImmersive.toggle()
                            }
                        }.offset(y: proxy.size.height / 2.8)
                    }
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                    }.padding()
                    
                    Spacer()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(name).font(.largeTitle)
                            Text(description)
                        }
                        Spacer()
                        Text("12 reviews")
                        HStack(spacing: 0.1) {
                            ForEach(0..<5, id: \.self) { idx in
                                Image(systemName: idx < 4 ? "star.fill" : "star")
                                
                            }
                        }
                    }
                    
                    Text(moreDescription).padding(.bottom, 20)
                    
                    ForEach(productInformationLabels, id: \.self) { label in
                        VStack {
                            Divider().offset(y: -10)
                            HStack {
                                Text(label)
                                Spacer()
                                Image(systemName: "plus")
                            }
                        }.padding(.bottom, 5)
                        
                    }
                    
                    HStack {
                        Spacer()
                        HStack {
                            Button(action: {
                                if count > 0 { count -= 1 }
                            }) {
                                Image(systemName: "minus")
                                    .clipShape(Circle())
                            }
                            
                            Text("\(count)")
                                .font(.system(size: 20, weight: .bold))
                            
                            
                            Button(action: {
                                count += 1
                            }) {
                                Image(systemName: "plus")
                                    .clipShape(Circle())
                            }
                        }
                        .background(RoundedRectangle(cornerRadius: 22).fill(Color.white.opacity(0.3)))
                        
                        Button {
                            
                        } label: {
                            Text("Add to cart (\(price, format: .currency(code: "USD")))")
                                .foregroundStyle(.black)
                              
                                
                        }.background(Color.yellow, in: RoundedRectangle(cornerRadius: 22))

                    }
                    
                    Spacer()
                    
                }
                .padding()
                
                
            }
        }
        .glassBackgroundEffect()
        
    }
}

#Preview {
    FurniturePostDetailView(image: "table12d", name: "Table 1", description: "Side table, stone, 40x28cm", price: 83)
}
