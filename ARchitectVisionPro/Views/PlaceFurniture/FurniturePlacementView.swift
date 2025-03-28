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
            if let scene = try? await Entity(named: "table1", in: realityKitContentBundle) {
                scene.components.set(CollisionComponent(shapes: [.generateBox(size: [0.1, 0.1, 0.1])]))
                scene.components.set(InputTargetComponent(allowedInputTypes: .all))
                content.add(scene)

        
                print("scene's position: ", scene.position)
                
                if let lock = attachments.entity(for: "lock") {
                    
                    lock.position = scene.position + SIMD3<Float>(0, 2, 0)
                
                    scene.addChild(lock)
                    
                    print("label's position: ", lock.position)
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
                .targetedToAnyEntity()
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
