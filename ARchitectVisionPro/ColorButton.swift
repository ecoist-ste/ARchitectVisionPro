//
//  ColorButton.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/6/25.
//

import SwiftUI

struct ColorButton: View {
    
    @State var color: Color
    var selectColor: () -> Void
    
    var body: some View {
        Button {
            selectColor()
        } label: {
            Circle()
                .foregroundStyle(color)
                .frame(height: 34)
        }
    }
}

#Preview {
    ColorButton(color: .cyan) {
        
    }
}
