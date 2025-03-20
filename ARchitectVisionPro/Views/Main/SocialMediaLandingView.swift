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
                Section("Intro") {
                    Text("This is intro")
                }

                Section("Furniture-Inspirations") {
                    Text("This is furniture-inspiration")
                }
                
                Section("User-Posts") {
                    
                }
                HStack { Spacer() }
            }
            .padding()
        }
        .glassBackgroundEffect()
    }
}

#Preview {
    SocialMediaLandingView()
}
