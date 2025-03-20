//
//  AppState.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/20/25.
//

import Foundation

@Observable
class AppState {
    let immersiveSpaceID = "ImmersiveSpace"
    enum WindowState {
        case Authentication
        case SocialMedia
        case Me
    }
    
    var currentState = WindowState.Authentication
}
