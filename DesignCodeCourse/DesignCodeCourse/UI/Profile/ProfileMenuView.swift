//
//  MenuView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 7/04/21.
//

import SwiftUI

struct ProfileMenuView: View {
    var body: some View {
        let progress = 0.38
        let progressFormatter = NumberFormatter()
        progressFormatter.numberStyle = .percent
        let percent = progressFormatter.string(from: NSNumber(value: progress)) ?? "0%"
        
        return VStack {
            Spacer()
            VStack(spacing: 16) {
                Text("Fabián - \(percent) complete")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color(#colorLiteral(red: 0.3450980392, green: 0.3843137255, blue: 0.4431372549, alpha: 1)))
                
                ProfileProgressView(progress: CGFloat(progress))
                
                MenuRow(title: "Account", iconName: "gear")
                MenuRow(title: "Billing", iconName: "creditcard")
                MenuRow(title: "Sign out", iconName: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(linearGradient)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
            .overlay(
                Image("Avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -150)
            )
        }
        .padding(.bottom, 30)
    }
    
    private let linearGradient = LinearGradient(
        gradient: Gradient(colors: [Color.white, Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]),
        startPoint: .top,
        endPoint: .bottom
    )
}

fileprivate struct MenuRow: View {
    let title: String
    let iconName: String
    
    var body: some View {
        Button(action: {}, label: {
            HStack(spacing: 16) {
                Image(systemName: iconName)
                    .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
                    .font(.system(size: 20, weight: .light))
                    .imageScale(.large)
                    .frame(width: 32, height: 32)
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .frame(width: 120, alignment: .leading)
            }
        })
    }
}

fileprivate struct ProfileProgressView: View {
    let progress: CGFloat
    
    var body: some View {
        let progressWidth = 130 * progress
        
        return Color.white
            .frame(width: progressWidth, height: 6)
            .cornerRadius(3)
            .frame(width: 130, height: 6, alignment: .leading)
            .background(Color.black.opacity(0.083))
            .cornerRadius(3)
            .padding(10)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7882352941, green: 0.8196078431, blue: 0.862745098, alpha: 1)), Color(#colorLiteral(red: 0.8705882353, green: 0.8901960784, blue: 0.9294117647, alpha: 1))]),
                    startPoint: .top,
                    endPoint: .bottom)
            )
            .cornerRadius(16)
    }
}

struct ProfileMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMenuView()
    }
}
