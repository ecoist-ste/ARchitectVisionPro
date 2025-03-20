//
//  AuthenticationView.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/20/25.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var showInstruction = false
    @State private var showWelcomePage = false
    @State private var showLandingPage = false
    @State private var isHighlighted = false
    @State private var isPressing = false
    @State private var rectangleColor: Color = .white
    @State private var textColor: Color = .black
    
    
    var body: some View {
        ZStack {
            if showLandingPage {
                TabControllerView()
                    .transition(.opacity)
            } else if showWelcomePage {
                WelcomeView()
                    .transition(.opacity)
                    .animation(.easeInOut, value: showWelcomePage)
            } else {
                authentication
                    .transition(.opacity)
            }
        }
        .animation(.default, value: showLandingPage)
    }
    
    var authentication: some View {
        VStack {
            Spacer()
            HStack { Spacer() }
            
            logo
            
            Text(showInstruction || !showLandingPage ? "Long Press Logo to Continue" : "")
                .opacity(0.5)
                .transition(.opacity)
            
            Spacer()
        }
        .glassBackgroundEffect()
    }
    
    var logo: some View {
        VStack {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(rectangleColor)
                        .frame(width: isPressing ? 200 : 120, height: isPressing ? 200 : 120)
                        .cornerRadius(20)
                    Text("AR")
                        .font(.system(size: 75, design: .rounded))
                        .foregroundColor(textColor)
                        .animation(.easeInOut(duration: 2), value: textColor)
                }
                
                
                Text("chitect")
                    .font(.system(size: 75, weight: .ultraLight, design: .rounded))
                    .foregroundColor(.black)
                
            }
            .onLongPressGesture(minimumDuration: 2) {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    showWelcomePage = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) { showLandingPage = true }
            } onPressingChanged: { value in
                startColorChangeTimer()
                isPressing = value
            }
            
            Text("Find your inspirations")
                .padding(.top, 2)
                .padding(.bottom, 5)
              
            
        }
        .animation(.spring, value: isPressing)
        .padding()
    }
}

extension AuthenticationView {
    func startColorChangeTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            isHighlighted = true
            rectangleColor = isHighlighted ? .black : .white
            textColor = isHighlighted ? .white : .black
        }
    }
}

#Preview {
    AuthenticationView()
}
