//
//  ARchitectVisionProApp.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/5/25.
//

import SwiftUI

@main
struct ARchitectVisionProApp: App {

//    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowResizability(.contentSize)
        
        WindowGroup(for: Label.self) { $label in
            LabelView(label: $label)    
        } defaultValue: {
            Label(text: "", cornerRadius: 20)
        }
        .windowResizability(.contentSize)
        .windowStyle(.plain)
        
        ImmersiveSpace(id: "Chair") {
            FurniturePlacementView()
        }
        

     }
}
