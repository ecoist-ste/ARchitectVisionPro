//
//  LabelView.swift
//  ARchitectVisionPro
//
//  Created by Songyuan Liu on 3/6/25.
//

import SwiftUI

struct LabelView: View {
    @Binding var label: Label
    
    var body: some View {
        TextField("Type to enter text", text: $label.text, axis: .vertical)
            .frame(width: 500, height: 500)
            .padding(50)
            .background(.cyan, in: RoundedRectangle(cornerRadius: label.cornerRadius))
            .foregroundStyle(.black)
            .font(.system(size: 40, weight: .semibold))
            
    }
}

#Preview {
    @Previewable @State var label = Label()
    LabelView(label: $label)
}
