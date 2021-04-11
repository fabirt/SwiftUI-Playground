//
//  CoursesListView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 11/04/21.
//

import SwiftUI

struct CoursesListView: View {
    @State var selectedCourse: SectionItem? = nil
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(homeSections.reversed()) { (item: SectionItem) in
                let isShown = self.selectedCourse?.id == item.id
                GeometryReader { (proxy: GeometryProxy) in
                    CourseComplexView(
                        item: item,
                        show: isShown,
                        onOpen: { self.selectedCourse = item },
                        onClose: { self.selectedCourse = nil }
                    )
                    .offset(y: isShown ? -proxy.frame(in: .global).minY : 0.0)
                    //.padding(.bottom, isShown ? proxy.frame(in: .global).minY : 0.0)
                }
                .zIndex(isShown ? 1.0 : 0.0)
                .frame(height: isShown ? screen.height : 280)
                .frame(maxWidth: isShown ? .infinity : screen.width - 60)
            }
        }
        .statusBar(hidden: selectedCourse != nil)
    }
}
