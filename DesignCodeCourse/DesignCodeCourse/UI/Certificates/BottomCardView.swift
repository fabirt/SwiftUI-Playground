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
        
        return BottomCardViewContent(show: $show)
            .offset(y: show ? 360 : screen.height)
            .offset(y: translation.height)
            .zIndex(3)
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .gesture(dragGesture)
    }
}

fileprivate struct BottomCardViewContent: View {
    @Binding var show: Bool
    
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
            HStack(spacing: 20) {
                RingView(progress: 20 / 25, size: 88.0, startColor: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), endColor: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), show: $show)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("SwiftUI")
                        .fontWeight(.bold)
                    Text("20 of 25 sections completed\n10 hours spent so far")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4.0)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
            }
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
