//
//  WatchingsView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 10/04/21.
//

import SwiftUI

struct WatchingsView: View {
    
    var body: some View {
        HStack(spacing: 30) {
            HStack(spacing: 16) {
                RingView(progress: 0.68, size: 44.0, show: .constant(true))
                VStack(alignment: .leading) {
                    Text("6 minutes left")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("Watched 10 mins today")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .proShadow()
            
            RingView(progress: 0.92, size: 44.0, startColor: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), endColor: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), show: .constant(true))
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .proShadow()
            
            RingView(progress: 0.24, size: 44.0, startColor: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), endColor: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), show: .constant(true))
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .proShadow()
            
            Spacer()
        }
        .padding(.horizontal, 30)
        .padding(.top, 20)
        .padding(.bottom, 42)
    }
}
