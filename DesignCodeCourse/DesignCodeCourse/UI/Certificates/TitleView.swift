//
//  TitleView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 7/04/21.
//

import SwiftUI

struct TitleView: View {
    @Binding var blurred: Bool
    @Binding var opaque: Bool
    
    var body: some View {
        TitleViewContent()
            .blur(radius: blurred ? 10.0 : 0)
            .opacity(opaque ? 0.4 : 1)
            .offset(y: opaque ? -100 : 0)
            .animation(
                Animation.default
                    .delay(0.1)
                //.speed(2)
                //.repeatForever()
            )
    }
   
}

fileprivate struct TitleViewContent: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }.padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleViewContent()
    }
}
