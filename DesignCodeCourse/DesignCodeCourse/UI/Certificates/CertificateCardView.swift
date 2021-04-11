//
//  CertificateCardView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 7/04/21.
//

import SwiftUI

struct CertificateCardView: View {
    @Binding var translation: CGSize
    @Binding var showDetail: Bool
    @Binding var isDragging: Bool
    
    var body: some View {
        let cardDragGesture = DragGesture()
            .onChanged { value in
                guard !self.showDetail else {
                    return
                }
                
                self.isDragging = true
                self.translation = value.translation
            }
            .onEnded { value in
                self.isDragging = false
                self.translation = .zero
            }
        
        let longPressGesture = LongPressGesture()
            .onEnded { value in
                self.isDragging = true
            }
        
        _ = longPressGesture.sequenced(before: cardDragGesture)
        
        return ZStack {
            BackCardView(
                width: showDetail ? 300 : 340,
                backgroundColor: Color("card4"))
                .offset(x: 0, y: isDragging ? -400 : -40.0)
                .offset(translation)
                .offset(y: showDetail ? -160 : 0)
                .scaleEffect(showDetail ? 1 : 0.9)
                .rotationEffect(.degrees(isDragging ? 0 : 10))
                .rotationEffect(.degrees(showDetail ? -10 : 0))
                .rotation3DEffect(
                    .degrees(showDetail ? 0 : 10),
                    axis: (x: 10.0, y: 0.0, z: 0.0)
                )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackCardView(
                width: 340,
                backgroundColor: Color("card3"))
                .offset(x: 0, y: isDragging ? -200 : -20.0)
                .offset(translation)
                .offset(y: showDetail ? -130 : 0)
                .scaleEffect(showDetail ? 1 : 0.95)
                .rotationEffect(.degrees(isDragging ? 0 : 5))
                .rotationEffect(.degrees(showDetail ? -5 : 0))
                .rotation3DEffect(
                    .degrees(showDetail ? 0 : 5),
                    axis: (x: 10.0, y: 0.0, z: 0.0)
                )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            CertificateCardViewContent()
                .frame(width: showDetail ? .infinity : 340, height: 220)
                .background(Color.black)
                .clipShape(
                    RoundedRectangle(cornerRadius: showDetail ? 30 : 20, style: .continuous
                    )
                )
                .shadow(radius: 20)
                .offset(translation)
                .offset(y: showDetail ? -100 : 0)
                .blendMode(.hardLight)
                .animation(Animation.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showDetail.toggle()
                }
                .gesture(cardDragGesture)
        }
        .zIndex(isDragging ? 4 : 2)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity)
    }
}

fileprivate struct CertificateCardViewContent: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Certificate")
                        .foregroundColor(.systemBlue)
                }
                Spacer()
                Image("Logo1")
            }.padding(.horizontal)
            .padding(.top)
            
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}
