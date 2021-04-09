//
//  UpdateItem.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 9/04/21.
//

import Foundation

struct UpdateItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let body: String
    let date: Date
    
    var displayDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter.string(from: date).uppercased()
    }
}
