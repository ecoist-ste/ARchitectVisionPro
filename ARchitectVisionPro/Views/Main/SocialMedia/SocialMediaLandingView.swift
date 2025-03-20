//
//  SocialMediaLandingView.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/20/25.
//

import SwiftUI

// Add a padded square frame over a blue background.

struct SocialMediaLandingView: View {
    @State private var text: String = ""
    @State private var sliderValue: Double = 0
    
    var body: some View {
        ScrollView {
            LazyVStack {
                featurePostView
                
                furnitureRecView
                
                othersPostsFeedView
                
            }
            .padding(50)
        }
        .glassBackgroundEffect()
    }
    
    // placed at the top of the feed
    // updated daily
    var featurePostView: some View {
        Image("poster1")
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(height: 450)
            .aspectRatio(contentMode: .fit)
            .overlay {
                Button("Discover ➜") {
                    
                }.buttonStyle(.bordered)
                    .offset(x: -450, y: 150)
            }
        
    }
    
    // shows a collection of furniture pieces
    // recommended to the user
    var furnitureRecView: some View {
        VStack(alignment: .leading) {
            Text("Get Inspired").font(.extraLargeTitle)
            FurnitureFiltersView()
            HStack { Spacer() }
        }
    }
    
    var othersPostsFeedView: some View {
        FurniturePostView()
        .padding()
        
    }
}

#Preview {
    SocialMediaLandingView()
}
