//
//  Modifiers.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 10/04/21.
//

import SwiftUI
import UIKit

struct ProShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.16), radius: 16, x: 0, y: 10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    
    func proShadow() -> some View {
        self.modifier(ProShadowModifier())
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    func safeArea(
        top: Bool = true,
        left: Bool = true,
        bottom: Bool = true,
        right: Bool = true
    ) -> some View {
        let insets = windowInsets()
        return padding(.top, top ? insets.top : 0.0)
            .padding(.leading, left ? insets.left : 0.0)
            .padding(.bottom, bottom ? insets.bottom : 0.0)
            .padding(.trailing, right ? insets.right : 0.0)
    }
    
    private func windowInsets() -> UIEdgeInsets {
        let insets = UIApplication.shared.windows.first?.safeAreaInsets
        
        return UIEdgeInsets(
            top: insets?.top ?? 0.0,
            left: insets?.left ?? 0.0,
            bottom: insets?.bottom ?? 0.0,
            right: insets?.right ?? 0.0
        )
    }
}
