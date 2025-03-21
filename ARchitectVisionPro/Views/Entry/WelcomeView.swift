//
//  TabControllerView.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/20/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("banner1")
                .resizable()
            VStack {
                Spacer()
                Text("Welcome, Architect!")
                    .font(.system(size: 50))
                    .bold()
                Spacer()
                HStack { Spacer() }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
