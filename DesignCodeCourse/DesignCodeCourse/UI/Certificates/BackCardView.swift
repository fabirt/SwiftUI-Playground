//
//  BackCardView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 7/04/21.
//

import SwiftUI

struct BackCardView: View {
    var width: CGFloat
    var backgroundColor: Color = Color.blue
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: width, height: 220)
        .background(backgroundColor)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView_Previews: PreviewProvider {
    static var previews: some View {
        BackCardView(
            width: 340
        )
    }
}
