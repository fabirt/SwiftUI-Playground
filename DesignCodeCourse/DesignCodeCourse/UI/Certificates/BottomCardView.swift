//
//  BottomCardView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 7/04/21.
//

import SwiftUI

struct BottomCardView: View {
    @Binding var show: Bool
    @Binding var translation: CGSize
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                if value.translation.height < -300 {
                    return
                }
                self.translation = value.translation
            }
            .onEnded { value in
                if (value.translation.height > 100 || value.predictedEndTranslation.height > 200) {
                    self.show = false
                }
                self.translation = .zero
            }
        
        return BottomCardViewContent()
            .offset(y: show ? 360 : 1000)
            .offset(y: translation.height)
            .zIndex(3)
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .gesture(dragGesture)
    }
}

fileprivate struct BottomCardViewContent: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("This certificate is proof that Fabián Diartt has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 8)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}
