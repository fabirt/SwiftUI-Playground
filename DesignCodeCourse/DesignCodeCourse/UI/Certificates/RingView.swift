//
//  RingView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 10/04/21.
//

import SwiftUI

struct RingView: View {
    var progress: Float = 0.0
    var size: CGFloat = 48.0
    var startColor: Color = Color("card3")
    var endColor: Color = Color("card1")
    @Binding var show: Bool
    
    var multiplier: CGFloat {
        size / 48.0
    }
    
    var body: some View {
        let progress = self.progress > 1 ? 1.0 : self.progress
        
        let gradient = LinearGradient(
            gradient: Gradient(colors: [startColor, endColor]),
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
        
        let activeStrokeStyle = StrokeStyle(
            lineWidth: 5 * multiplier,
            lineCap: .round,
            lineJoin: .round,
            miterLimit: 0,
            dash: [20, 0],
            dashPhase: 0
        )
        
        let inactiveStrokeStyle = StrokeStyle(lineWidth: 10 * multiplier)
        
        return ZStack {
            Circle()
                .fill(innerLinearGradient)
                .frame(width: size, height: size)
            
            Circle()
                .stroke(Color.black.opacity(0.1), style: inactiveStrokeStyle)
                .frame(width: size, height: size)
            
            Circle()
                .trim(from: 0.0, to: show ? CGFloat(progress) : 0.0)
                .stroke(gradient, style: activeStrokeStyle)
                .rotationEffect(.degrees(270))
                //.rotation3DEffect(.degrees(180), axis: (x: 1.0, y: 0.0, z: 0.0))
                .frame(width: size, height: size)
                .shadow(
                    color: Color("card1").opacity(0.2),
                    radius: 3 * multiplier,
                    x: 0,
                    y: 4 * multiplier
                )
            
            Text(NSNumber(value: progress).toPercent())
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
    
    private let innerLinearGradient = LinearGradient(
        gradient: Gradient(colors: [Color.white, Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]),
        startPoint: .top,
        endPoint: .bottom
    )
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(progress: 0.8, size: 280, show: .constant(true))
    }
}
