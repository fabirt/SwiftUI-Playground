//
//  SectionItem.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 8/04/21.
//

import SwiftUI

struct SectionItem: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var logoName: String
    var image: Image
    var backgroundColor: Color
}
