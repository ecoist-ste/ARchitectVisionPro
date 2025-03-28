//
//  AppState.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/20/25.
//

import Foundation

@Observable
class AppState: ObservableObject {
    let immersiveSpaceID = "PreviewFurniture"
    enum WindowState {
        case authentication
        case socialMedia
        case me
    }
    
    var currentState = WindowState.authentication
    
    var isImmersive = false
}

