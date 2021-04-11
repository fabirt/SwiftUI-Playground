//
//  Number.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 10/04/21.
//

import Foundation

extension NSNumber {
    func toPercent() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter.string(from: self) ?? "0%"
    }
}
