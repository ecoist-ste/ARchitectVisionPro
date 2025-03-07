//
//  PlanetView.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/5/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct PlanetView: View {
    
    @State private var enlarge = false
    
    var body: some View {
        RealityView { content, attachments in
            if let scene = try? await Entity(named: "Planets", in: realityKitContentBundle) {
                content.add(scene)
                print("scene's position: ", scene.position)
                
                if let label = attachments.entity(for: "saturn1") {
                    label.position = [0.5, 1.5, -2]
                    scene.addChild(label)
                    print("label's position: ", label.position)
                }
            }
        } update: { content, attachments in
            if let scene = content.entities.first {
                let uniformScaleFactor: Float = enlarge ? 2.0 : 1.0
                scene.scale = [uniformScaleFactor, uniformScaleFactor, uniformScaleFactor]
                print("scene's position: ", scene.position)
            }
        } attachments: {
            Attachment(id: "saturn1") {
                Text("Saturn 1")
                    .font(.extraLargeTitle)
                    .padding()
                    .glassBackgroundEffect()
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded({ _ in
            print("enlarg button is toggled")
            enlarge.toggle()
        }))
    }
}

#Preview(immersionStyle: .mixed) {
    PlanetView()
        .environment(AppModel())
}
