//
//  ContentView.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/5/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(\.openWindow) var openWindow
    
    @State private var label = Label()
    @State private var enlarge = false
    @State private var isImmersive = false
    
    
    var body: some View {
        VStack {
            RealityView { content in
                if let globe = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    content.add(globe)
                }
            } update: { content in
                if let scene = content.entities.first {
                    let uniformScale: Float = enlarge ? 2.0 : 1.0
                    scene.transform.scale = [uniformScale, uniformScale, uniformScale]
                    
                }
            } placeholder: {
                ProgressView()
            }
            

            VStack {
                if isImmersive {
                    Button("Close Immersive Space") {
                        Task {
                            await dismissImmersiveSpace()
                        }
                        isImmersive.toggle()
                    }
                } else {
                    Button("Open Immersive Space") {
                        Task {
                            await openImmersiveSpace(id: "Chair")
                        }
                        isImmersive.toggle()
                    }
                }
                Button(enlarge ? "Shrink" : "Enlarge") {
                    enlarge.toggle()
                }
            }
            
        }
        
        
    }
    
    var ornament: some View {
        LabelView(label: $label)
            .padding()
            .ornament(attachmentAnchor: .scene(.bottom)) {
                
                HStack(spacing: 30) {
                    Slider(value: $label.cornerRadius, in: 0...100)
                        .frame(width: 100)
                    
                    
                    Button("Create") {
                        openWindow(value: label)
                        label = Label()
                        
                    }
                    
                }
                .padding()
                .glassBackgroundEffect()
            }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
