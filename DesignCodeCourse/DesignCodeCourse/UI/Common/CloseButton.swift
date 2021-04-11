//
//  CloseButton.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 11/04/21.
//

import SwiftUI

struct CloseButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .frame(width: 36, height: 36)
            .foregroundColor(.white)
            .background(Color.black)
            .clipShape(Circle())
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}
