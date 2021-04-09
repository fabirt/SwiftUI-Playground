//
//  SectionItem.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 8/04/21.
//

import SwiftUI

struct SectionItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let logoName: String
    let image: Image
    let backgroundColor: Color
}
