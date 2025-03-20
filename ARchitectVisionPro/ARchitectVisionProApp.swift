//
//  ARchitectVisionProApp.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/5/25.
//

import SwiftUI

@main
struct ARchitectVisionProApp: App {

    @State private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            AuthenticationView()
                .environment(appState)
        }.windowResizability(.contentSize)
        
        
        /// The code below allows the user to open up a new window, super cool, and we might use it later
//        WindowGroup(for: Label.self) { $label in
//            
//        } defaultValue: {
//            Label(text: "", cornerRadius: 20)
//        }
//        .windowResizability(.contentSize)
//        .windowStyle(.plain)
        
        ImmersiveSpace(id: "Chair") {
            FurniturePlacementView()
        }
        

     }
}
