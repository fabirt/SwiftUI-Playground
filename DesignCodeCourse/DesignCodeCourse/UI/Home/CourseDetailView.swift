//
//  CourseDetailView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 11/04/21.
//

import SwiftUI

struct CourseDetailView: View {
    var item: SectionItem
    var onClose: () -> Void
    
    @State private var viewTranslation: CGSize = .zero
    
    let springAnimation = Animation.spring(
        response: 0.5,
        dampingFraction: 0.6,
        blendDuration: 0)
    
    
    var body: some View {
        let isDragging = viewTranslation.height > 0
        
        return ZStack(alignment: .top) {
            Color.white
                .cornerRadius(isDragging ? 50 : 0)
            
            item.backgroundColor
                .frame(height: screen.height * 0.8)
                .cornerRadius(50, corners: .bottomLeft)
                .cornerRadius(isDragging ? 50 : 0, corners: .topLeft)
                .cornerRadius(isDragging ? 50 : 0, corners: .topRight)
                .proShadow()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 240, alignment: .leading)
                        Text(item.subtitle.uppercased())
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    Spacer()
                    Image(systemName: "bag")
                        .padding(10)
                        .background(Color.white)
                        .clipShape(Circle())
                        .proShadow()
                        .onTapGesture {
                            self.onClose()
                        }
                }
                .padding(.top)
                .padding(.leading, 30)
                .padding(.trailing, 16)
                
                item.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 30)
                
                Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                    .font(.body)
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 30)
            }
        }
        .scaleEffect(isDragging ? 0.82 : 1)
        .animation(springAnimation)
        .gesture(
            DragGesture()
                .onChanged { value in
                    if (value.translation.height > 0) {
                        self.viewTranslation = value.translation
                    }
                }
                .onEnded { value in
                    if (value.predictedEndTranslation.height > 100) {
                        self.onClose()
                    }
                    self.viewTranslation = .zero
                }
        )
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(item: homeSections[0], onClose: { })
    }
}
