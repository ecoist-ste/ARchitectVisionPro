//
//  TabControllerView.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/20/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome")
                .font(.largeTitle)
            Spacer()
            HStack { Spacer() }
        }
        .glassBackgroundEffect()
    }
}

#Preview {
    WelcomeView()
}
