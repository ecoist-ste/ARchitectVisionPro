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
        .animation(.easeInOut, value: showWelcomePage)
        .animation(.easeInOut, value: showLandingPage)
    }
    
    var authentication: some View {
        ZStack {
            Image("banner1")
                .resizable()
            VStack {
                Spacer()
                HStack { Spacer() }
                
                logo

                Spacer()
            }
            .background(.thinMaterial)
        }
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
            .onAppear {
                startColorChangeTimer()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    showWelcomePage = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) { showLandingPage = true
                }
                
            }

            Text("Find your furniture inspirations")
                .font(.system(size: 20))
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
