//
//  CoursesListView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 11/04/21.
//

import SwiftUI

struct CoursesListView: View {
    var body: some View {
        VStack(spacing: 18) {
            ForEach(homeSections.reversed()) { (item: SectionItem) in
                SectionView(item: item, size: screen.width - 92)
            }
        }
    }
}
