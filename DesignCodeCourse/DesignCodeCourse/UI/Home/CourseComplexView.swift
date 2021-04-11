//
//  CourseComplexView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 11/04/21.
//

import SwiftUI

struct CourseComplexView: View {
    let item: SectionItem
    let show: Bool
    let onOpen: () -> Void
    let onClose: () -> Void
    @State private var dragTranslation: CGSize = .zero
    
    var body: some View {
        ZStack(alignment: .top) {
            if show {
                _TextContentView()
            }
            _CardView(item: item, show: show, onOpen: onOpen, onClose: onClose)
                .gesture(
                    show ?
                        DragGesture()
                        .onChanged { value in
                            guard value.translation.height < 300 else { return  }
                            guard value.translation.height > 0 else { return  }
                            self.dragTranslation = value.translation
                        }
                        .onEnded{ value in
                            if value.predictedEndTranslation.height > 100 {
                                self.onClose()
                            }
                            self.dragTranslation = .zero
                        }
                        : nil
                )
                .onTapGesture {
                    self.onOpen()
                }
        }
        
        .scaleEffect(1 - dragTranslation.height / 1000)
        .rotation3DEffect(
            .degrees(Double(dragTranslation.height / 10)),
            axis: (x: 0.0, y: 10.0, z: 0.0)
        )
    }
}

struct CourseComplexView_Previews: PreviewProvider {
    static var previews: some View {
        CourseComplexView(
            item: homeSections.first!,
            show: false,
            onOpen: { },
            onClose: { }
        )
    }
}

fileprivate struct _CardView: View {
    let item: SectionItem
    let show: Bool
    let onOpen: () -> Void
    let onClose: () -> Void
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(item.title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 220, alignment: .leading)
                Spacer()
                ZStack {
                    Image(item.logoName)
                        .opacity(show ? 0.0 : 1.0)
                    
                    CloseButton()
                        .onTapGesture {
                            self.onClose()
                        }
                        .opacity(show ? 1.0 : 0.0)
                }
            }
            Text(item.subtitle.uppercased())
                .font(.system(size: 15, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            item.image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding(.horizontal, show ? 30 : 16)
        .padding(.top)
        .safeArea(top: show, bottom: false)
        .frame(
            maxWidth: show ? .infinity : screen.width - 60,
            maxHeight: show ? 460.0 : 280.0
        )
        .background(item.backgroundColor)
        .cornerRadius(30)
        .shadow(color: item.backgroundColor.opacity(0.3), radius: 20, x: 0.0, y: 20.0)
        .edgesIgnoringSafeArea(.top)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.0))
    }
}

fileprivate struct _TextContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 30) {
                Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                
                Text("About this course")
                    .font(.title)
                    .bold()
                
                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
            }
            .padding(30)
            .padding(.top, 460)
        }
        .frame(width: screen.width, height: screen.height)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
        .transition(AnyTransition.opacity.animation(.default))
    }
}
