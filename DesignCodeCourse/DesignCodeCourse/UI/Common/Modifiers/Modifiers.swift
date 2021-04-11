//
//  Modifiers.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 10/04/21.
//

import SwiftUI

struct ProShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.16), radius: 16, x: 0, y: 10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

extension View {
    
    func proShadow() -> some View {
        self.modifier(ProShadowModifier())
    }
}
