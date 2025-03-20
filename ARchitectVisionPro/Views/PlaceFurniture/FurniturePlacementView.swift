//
//  FurniturePlacementView.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/5/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FurniturePlacementView: View {
    
    @State private var enlarge = false
    @State private var dragOffset: SIMD3<Float> = .zero
    @State private var furniturePosition: SIMD3<Float> = .zero
    @State private var isLocked = true
    
    var body: some View {
        RealityView { content, attachments in
            if let scene = try? await Entity(named: "Welcome", in: realityKitContentBundle) {
                content.add(scene)
                print("scene's position: ", scene.position)
                
                if let lock = attachments.entity(for: "lock") {
                    
                    lock.position = [0.5, 1.5, -2]
                
                    scene.addChild(lock)
                    
//                    print("label's position: ", label.position)
                }
            }
        } update: { content, attachments in
            if let scene = content.entities.first, !isLocked {
                scene.position = self.furniturePosition + self.dragOffset
//                print("scene's position: ", scene.position)
            }
        } attachments: {
            Attachment(id: "lock") {
                Button {
                    isLocked.toggle()
                } label: {
                    Text(self.isLocked ? "Unlock" : "lock")
                        .padding(20)
                        .font(.extraLargeTitle)
                        .glassBackgroundEffect()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .gesture(
            DragGesture()
                .onChanged{ value in
                    dragOffset.x = Float(value.translation.width) * 0.001
                    dragOffset.z = Float(value.translation.height) * 0.001

                }
                .onEnded { value in
                    furniturePosition += dragOffset
                    dragOffset = .zero
                }
        )
    }
}

#Preview(immersionStyle: .mixed) {
    FurniturePlacementView()
        .environment(AppState())
}
